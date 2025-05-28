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
        _initializeLetterKeys();
      });

      // allCommanders =
      //     commandersController.allCommandersListModel.data?.commanders;
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

  void _initializeLetterKeys() {
    final source = isFilterApplied ? filteredCommanders! : allCommanders!;
    final initials =
        filteredCommanders!.map((c) => c.name![0].toUpperCase()).toSet();
    for (var letter in initials) {
      _letterKeys[letter] = GlobalKey();
    }
  }

  void applyFilter(String filterType) {
    setState(() {
      isFilterApplied = true;
      currentFilter = filterType;
      List<Commanders> matches = List.from(allCommanders!);

      if (filterType == 'top') {
        matches.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
      } else if (filterType == 'low') {
        matches.sort((a, b) => (a.rating ?? 0).compareTo(b.rating ?? 0));
      }

      // Filter by selected service
      if (selectedService != null && selectedService!.isNotEmpty) {
        matches =
            matches
                .where(
                  (c) =>
                      c.service?.toLowerCase() ==
                      selectedService!.toLowerCase(),
                )
                .toList();
      }

      // Filter by selected units
      if (selectedUnits.isNotEmpty) {
        matches =
            matches
                .where(
                  (c) => selectedUnits.contains(c.unit?.toLowerCase() ?? ''),
                )
                .toList();
      }

      // Search query filtering
      if (searchQuery.isNotEmpty) {
        final exactMatches =
            matches
                .where(
                  (card) =>
                      card.name!.toLowerCase() == searchQuery.toLowerCase() ||
                      card.service?.toLowerCase() ==
                          searchQuery.toLowerCase() ||
                      card.unit?.toLowerCase() == searchQuery.toLowerCase(),
                )
                .toList();

        final partialMatches =
            matches
                .where(
                  (card) =>
                      card.name!.toLowerCase().contains(
                        searchQuery.toLowerCase(),
                      ) ||
                      (card.service?.toLowerCase() ?? '').contains(
                        searchQuery.toLowerCase(),
                      ) ||
                      (card.unit?.toLowerCase() ?? '').contains(
                        searchQuery.toLowerCase(),
                      ),
                )
                .where((card) => !exactMatches.contains(card))
                .toList();

        filteredCommanders = [...exactMatches, ...partialMatches];
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

  // void applyFilter(String filterType) {
  //   setState(() {
  //     currentFilter = filterType;
  //     List<Commanders> matches = List.from(allCommanders!);

  //     if (filterType == 'top') {
  //       matches.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
  //     } else if (filterType == 'low') {
  //       matches.sort((a, b) => (a.rating ?? 0).compareTo(b.rating ?? 0));
  //     }

  //     if (searchQuery.isNotEmpty) {
  //       final exactMatches =
  //           matches
  //               .where(
  //                 (card) =>
  //                     card.name!.toLowerCase() == searchQuery.toLowerCase() ||
  //                     card.service?.toLowerCase() ==
  //                         searchQuery.toLowerCase() ||
  //                     card.unit?.toLowerCase() == searchQuery.toLowerCase(),
  //               )
  //               .toList();

  //       final partialMatches =
  //           matches
  //               .where(
  //                 (card) =>
  //                     card.name!.toLowerCase().contains(
  //                       searchQuery.toLowerCase(),
  //                     ) ||
  //                     (card.service?.toLowerCase() ?? '').contains(
  //                       searchQuery.toLowerCase(),
  //                     ) ||
  //                     (card.unit?.toLowerCase() ?? '').contains(
  //                       searchQuery.toLowerCase(),
  //                     ),
  //               )
  //               .where((card) => !exactMatches.contains(card))
  //               .toList();

  //       filteredCommanders = [...exactMatches, ...partialMatches];
  //     } else {
  //       filteredCommanders = matches;
  //     }
  //   });

  //   _scrollController.animateTo(
  //     0,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void applySearchFilter(String query) {
    setState(() {
      searchQuery = query;
      applyFilter(currentFilter);
    });
  }

  void onFilterButtonPressed() {
    setState(() {
      applyFilter(currentFilter);
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
        // final displayCommanders =
        //     isFilterApplied ? filteredCommanders : allCommanders;

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
                      // ServiceMemberWidget(
                      //   services:
                      //       commandersController
                      //           .getAllServicesResponseModel
                      //           .data!
                      //           .services!,
                      //   onSelectionChanged: (selectedFilters) {
                      //     if (selectedFilters.isNotEmpty) {
                      //       applySearchFilter(selectedFilters.first);
                      //     } else {
                      //       applySearchFilter('');
                      //     }
                      //   },
                      // ),
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
                                selectedUnits = selectedFilters.toSet();
                                applyFilter(currentFilter);
                              });
                            },

                            // onSelectionChanged: (selectedFilters) {
                            //   if (selectedFilters.isNotEmpty) {
                            //     applySearchFilter(selectedFilters.first);
                            //   } else {
                            //     applyFilter(currentFilter);
                            //   }
                            // },
                          ),
                          const SizedBox(height: 20),
                          WideCustomButton(
                            showIcon: true,
                            sufixIcon: Icons.filter_list,
                            text: 'Filter',
                            onPressed: () {},
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
                            allCommanders!.map((card) {
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
                      onPressed: () {},
                      showIcon: true,
                      sufixIcon: Icons.arrow_forward,
                    ),
                    VerticalButtton(
                      height: 125,
                      quarterTurens: 1,
                      text: 'Lower Rated',
                      onPressed: () {},
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
