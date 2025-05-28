import 'package:commanderratings/features/commanders/controllers/commanders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/normal_custom_button.dart';
import '../../../../core/widgets/title_with_icon_prefix.dart';
import '../../../../core/widgets/wide_custom_button.dart';
import '../../domain/all_commanders_list_model.dart';
import '../../domain/get_all_service_response_model.dart';
import '../../domain/get_all_unit_response_model.dart';
import '../widgets/commanders_card_widget.dart';
import '../widgets/customBoxContainer.dart';
import '../widgets/filter_buttons_for_commanders.dart';
import '../widgets/service_member_widget.dart';
import '../widgets/title_text_all_commanders.dart';
import '../widgets/vertical_buttton.dart';
import 'add_commanders_screen.dart';

class AllCommandersScreen extends StatefulWidget {
  const AllCommandersScreen({super.key});

  @override
  State<AllCommandersScreen> createState() => _AllCommandersScreenState();
}

class _AllCommandersScreenState extends State<AllCommandersScreen> {
  bool isFilterApplied = false;

  final ScrollController _scrollController = ScrollController();
  final List<String> _alphabet = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );
  final Map<String, GlobalKey> _letterKeys = {};

  late List<Commanders>? allCommanders;
  late List<Commanders>? filteredCommanders;

  String? selectedService; // Single selection for service
  Set<String> selectedUnits = {};
  String currentFilter = 'all';
  String searchQuery = '';

  late GetAllServicesResponseModel getAllServicesResponseModel;
  late GetAllUnitResponseModel getAllUnitResponseModel;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  List<String> filterString = [];

  void addFilterString(String query){
    if(!filterString.contains(query)){
      filterString.add(query);
    }
  }

  Future<void> initializeData() async {

    final commandersController = Get.find<CommandersController>();

    // Load commanders data
    await commandersController.getAllCommanders();
    if (commandersController.allCommandersListModel != null &&
        commandersController.allCommandersListModel.data != null &&
        commandersController.allCommandersListModel.data!.commanders != null) {
      setState(() {
        allCommanders = List.from(
          commandersController.allCommandersListModel.data!.commanders!,
        );
        filteredCommanders = List.from(allCommanders!);
        //_initializeLetterKeys();
      });

    }

    // Load services data
    await commandersController.getAllServices();
    if (commandersController.getAllServicesResponseModel != null &&
        commandersController.getAllServicesResponseModel.data != null &&
        commandersController.getAllServicesResponseModel.data!.services !=
            null) {
      setState(() {
        getAllServicesResponseModel =
            commandersController.getAllServicesResponseModel;
      });
    }

    // Load units data
    await commandersController.getAllUnits();
    if (commandersController.getAllUnitResponseModel != null &&
        commandersController.getAllUnitResponseModel.data != null &&
        commandersController.getAllUnitResponseModel.data!.units != null) {
      setState(() {
        getAllUnitResponseModel = commandersController.getAllUnitResponseModel;
      });
    }
  }

  // void _initializeLetterKeys() {
  //   final source = isFilterApplied ? filteredCommanders! : allCommanders!;
  //   final initials =
  //       filteredCommanders!.map((c) => c.name![0].toUpperCase()).toSet();
  //   for (var letter in initials) {
  //     _letterKeys[letter] = GlobalKey();
  //   }
  // }


  void applyFilter(String filterType, String? serviceFilter) {
    setState(() {
      isFilterApplied = true;
      currentFilter = filterType;
      List<Commanders> matches = List.from(allCommanders!);

      // Sort by rating
      if (filterType == 'top') {
        matches.sort((a, b) => (b.avgRating ?? 0).compareTo(a.avgRating ?? 0));
      } else if (filterType == 'low') {
        matches.sort((a, b) => (a.avgRating ?? 0).compareTo(b.avgRating ?? 0));
      }

      // Filter by serviceBroad
      if (serviceFilter != null && serviceFilter.isNotEmpty) {
        matches = matches.where((c) {
          final service = c.serviceBroad?.toLowerCase() ?? '';
          final filter = serviceFilter.toLowerCase();
          return service.contains(filter); // Partial match
        }).toList();
      }

      // Search filtering (includes partial and full match — duplicates allowed)
      if (searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();

        final exactMatches = matches.where((c) =>
        (c.name?.toLowerCase() == query) ||
            (c.serviceBroad?.toLowerCase() == query) ||
            (c.unit?.toLowerCase() == query)
        ).toList();

        final partialMatches = matches.where((c) =>
        (c.name?.toLowerCase().contains(query) ?? false) ||
            (c.serviceBroad?.toLowerCase().contains(query) ?? false) ||
            (c.unit?.toLowerCase().contains(query) ?? false)
        ).toList();

        filteredCommanders = [...partialMatches];
      } else {
        filteredCommanders = matches;
      }
    });

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


// Normalize strings: lowercase + remove punctuation
  String _normalizeString(String input) {
    return input
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '') // remove symbols like ()
        .trim();
  }



  void applyFilterButton(String filterType, List<String>? unitFilters) {
    setState(() {
      isFilterApplied = true;
      currentFilter = filterType;

      // Defensive copy of allCommanders, fallback to empty list if null
      List<Commanders> matches = List.from(allCommanders ?? []);

      for(var data in matches){

        print('${data.unit} Units');

      }

      if (unitFilters != null && unitFilters.isNotEmpty) {
        // Normalize filter strings
        final lowerCaseUnits = unitFilters
            .map((u) => u.toLowerCase().trim())
            .where((u) => u.isNotEmpty)
            .toList();

        // Filter matches by unit list - partial case-insensitive matching
        matches = matches.where((card) {
          final unit = card.unit?.toLowerCase() ?? '';
          print((card.unit.toString()));
          return lowerCaseUnits.any((filter) => unit.contains(filter));
        }).toList();
      }
      filteredCommanders = matches;
      print('Filtered commanders count: ${filteredCommanders!.length}');
    });

    // Scroll to top
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


  // void applyFilterButton(String filterType, List<String>? serviceFilters) {
  //   setState(() {
  //     isFilterApplied = true;
  //     currentFilter = filterType;
  //     List<Commanders> matches = List.from(allCommanders!);
  //
  //     // Sort by rating solved
  //     if (filterType == 'top') {
  //       matches.sort((a, b) => (b.avgRating ?? 0).compareTo(a.avgRating ?? 0));
  //     } else if (filterType == 'low') {
  //       matches.sort((a, b) => (a.avgRating ?? 0).compareTo(b.avgRating ?? 0));
  //     }
  //     // Sort by rating solved
  //
  //     // Filter by serviceBroad
  //     if (serviceFilter != null && serviceFilter.isNotEmpty) {
  //       matches = matches
  //           .where((c) =>
  //       (c.serviceBroad ?? '').toLowerCase() ==
  //           serviceFilter.toLowerCase())
  //           .toList();
  //     }
  //
  //     // Apply search query if needed
  //     if (searchQuery.isNotEmpty) {
  //       final exactMatches = matches.where((card) {
  //         return card.name!.toLowerCase() == searchQuery.toLowerCase() ||
  //             card.serviceBroad?.toLowerCase() == searchQuery.toLowerCase() ||
  //             card.unit?.toLowerCase() == searchQuery.toLowerCase();
  //       }).toList();
  //
  //       final partialMatches = matches
  //           .where((card) =>
  //       card.name!.toLowerCase().contains(searchQuery.toLowerCase()) ||
  //           (card.serviceBroad?.toLowerCase() ?? '')
  //               .contains(searchQuery.toLowerCase()) ||
  //           (card.unit?.toLowerCase() ?? '')
  //               .contains(searchQuery.toLowerCase()))
  //           .where((card) => !exactMatches.contains(card))
  //           .toList();
  //
  //       filteredCommanders = [...exactMatches, ...partialMatches];
  //     } else {
  //       filteredCommanders = matches;
  //     }
  //   });
  //
  //   _scrollController.animateTo(
  //     0,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void applySearchFilter(String query) {
    setState(() {
      searchQuery = query;
      applyFilter(currentFilter, query);
    });
  }

  void onFilterButtonPressed() {
    setState(() {
      applyFilter(currentFilter, 'Air Force');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<CommandersController>(
      builder: (commandersController) {
        if (commandersController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TitleWithIconPrefix(
                    fontSize: 12,
                    text: 'All commanders',
                  ),
                  NormalCustomButton(
                    text: 'Add Commmander +',
                    fontSize: 12,
                    height: 40,
                    weight: 135,
                    onPressed: () {
                      Get.to(() => const AddCommandersScreen());
                    },
                  ),
                ],
              ),
            ),
            leadingWidth: size.width * 0.05,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  controller: _scrollController,
                  children: [
                    if (getAllServicesResponseModel.data?.services != null)



                      ServiceMemberWidget(
                        services:
                            commandersController
                                .getAllServicesResponseModel
                                .data!
                                .services!,
                        onFilterSelected: (selectedService) {
                          applySearchFilter(selectedService ?? '');
                        },
                      ),

                    const SizedBox(height: 20),
                    if (getAllUnitResponseModel.data?.units != null)

                      Customboxcontainer(
                        children: [
                          const TitleTextAllCommanders(text: 'Units'),
                          const SizedBox(height: 10),

                          FilterButtonsForCommanders(
                            units:
                                commandersController
                                    .getAllUnitResponseModel
                                    .data!
                                    .units!,
                            onSelectionChanged: (selectedFilters) {
                              setState(() {
                                addFilterString(selectedFilters);
                              });
                            },
                          ),

                          const SizedBox(height: 20),

                          WideCustomButton(
                            showIcon: true,
                            sufixIcon: Icons.filter_list,
                            text: 'Filter',
                            onPressed: () {
                              applyFilterButton('', filterString);
                            },
                          ),

                        ],
                      ),
                    const SizedBox(height: 36),

                    // if (displayCommanders != null &&
                    //     displayCommanders.isNotEmpty)
                    if ((isFilterApplied
                                ? filteredCommanders
                                : allCommanders) !=
                            null &&
                        (isFilterApplied ? filteredCommanders : allCommanders)!
                            .isNotEmpty)
                      Column(
                        children:
                        (isFilterApplied ? filteredCommanders! : allCommanders!).map((card) {
                              String initial = card.name![0].toUpperCase();
                              final key =
                                  _letterKeys.containsKey(initial)
                                      ? _letterKeys[initial]
                                      : null;
                              return Container(
                                child: CommandersCardWidget(card: card),
                              );
                            }).toList(),
                      )
                    else
                      const Center(child: Text('No commanders found')),
                  ],
                ),
              ),

              Positioned(
                right: 4,
                top: 60,
                bottom: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      _alphabet.map((letter) {
                        final enabled = _letterKeys.containsKey(letter);
                        return GestureDetector(
                          onTap:
                              enabled
                                  ? () {
                                    final context =
                                        _letterKeys[letter]?.currentContext;
                                    if (context != null) {
                                      Scrollable.ensureVisible(
                                        context,
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  }
                                  : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 10,
                                color: enabled ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),

              Positioned(
                right: 10,
                top: 65,
                bottom: 60,
                child: Column(
                  children: [
                    VerticalButtton(
                      text: 'Top Rated',
                      onPressed: () => applyFilter('top', ""),
                      showIcon: true,
                      sufixIcon: Icons.arrow_forward,
                    ),
                    VerticalButtton(
                      height: 125,
                      quarterTurens: 1,
                      text: 'Lower Rated',
                      onPressed: () => applyFilter('low', ""),
                      showIcon: true,
                      sufixIcon: Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
