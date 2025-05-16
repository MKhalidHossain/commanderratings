// import 'dart:math' as math;

// import 'package:commanderratings/core/widgets/wide_custom_button.dart';
// import 'package:commanderratings/features/all_commanders/core/commanders_card.dart';
// import 'package:commanderratings/features/all_commanders/presentation/widgets/commanders_card_widget.dart';
// import 'package:commanderratings/features/all_commanders/presentation/widgets/filter_buttons_for_commanders.dart';
// import 'package:commanderratings/features/all_commanders/presentation/widgets/vertical_buttton.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:commanderratings/core/widgets/normal_custom_button.dart';
// import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
// import 'package:commanderratings/features/add_commander/presentation/screens/add_commanders_screen.dart';
// import 'package:commanderratings/features/all_commanders/presentation/widgets/customBoxContainer.dart';
// import 'package:commanderratings/features/all_commanders/presentation/widgets/title_text_all_commanders.dart';
// import '../widgets/service_member_widget.dart';

// class AllCommandersScreen extends StatefulWidget {
//   const AllCommandersScreen({super.key});

//   @override
//   State<AllCommandersScreen> createState() => _AllCommandersScreenState();
// }

// class _AllCommandersScreenState extends State<AllCommandersScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final Map<String, GlobalKey> _sectionKeys = {};

//   //...............................for scroollable alpabets ..............................
//   final List<String> _alphabet = List.generate(
//     26,
//     (index) => String.fromCharCode(65 + index),
//   );

//   final Map<String, List<String>> groupedCommanders = {
//     'A': ['Anderson', 'Ames'],
//     'B': ['Baker', 'Bryant'],
//     'C': ['Clark', 'Carter'],
//     'd': ['Davis', 'Diaz'],
//     // Add more...
//   };
//   final List<CommandersCard> commandersCards = [
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//     CommandersCard(
//       name: 'Jeffrey Adams',
//       designation: '(RET) Air Forces',
//       image: 'assets/images/banner/banner_for_commanders_details.png',
//       rating: 5.5,
//       uploadedTime: '9 Hours Ago',
//     ),
//   ];
//   late List<CommandersCard> allCommanders;
//   late List<CommandersCard> filteredCommanders; // filtered data

//   @override
//   void initState() {
//     super.initState();
//     for (var letter in groupedCommanders.keys) {
//       _sectionKeys[letter] = GlobalKey();
//     }
//     late List<CommandersCard> filteredCommanders; // filtered data
//   }

//   void scrollToLetter(String letter) {
//     final context = _sectionKeys[letter]?.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void applyFilter(String filterType) {
//   setState(() {
//     if (filterType == 'top') {
//       filteredCommanders = allCommanders
//           .where((card) => card.rating >= 5)
//           .toList();
//     } else if (filterType == 'low') {
//       filteredCommanders = allCommanders
//           .where((card) => card.rating < 5)
//           .toList();
//     } else {
//       filteredCommanders = List.from(allCommanders);
//     }
//   });

//   // Auto scroll to top after filtering
//   _scrollController.animateTo(
//     0,
//     duration: const Duration(milliseconds: 300),
//     curve: Curves.easeInOut,
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: false,
//         title: Padding(
//           padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const TitleWithIconPrefix(fontSize: 12, text: 'All commanders'),
//               NormalCustomButton(
//                 text: 'Add Commmander +',
//                 fontSize: 12,
//                 height: 40,
//                 weight: 135,
//                 onPressed: () {
//                   Get.to(() => AddCommandersScreen());
//                 },
//               ),
//             ],
//           ),
//         ),
//         leadingWidth: size.width * 0.05,
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(
//               controller: _scrollController,
//               children: [
//                 ServiceMemberWidget(),
//                 const SizedBox(height: 20),
//                 Customboxcontainer(
//                   children: [
//                     TitleTextAllCommanders(text: 'Units'),
//                     const SizedBox(height: 10),
//                     FilterButtonsForCommanders(
//                       onSelectionChanged: (selectedFilters) {
//                         print("Selected: $selectedFilters");
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     WideCustomButton(
//                       showIcon: true,
//                       sufixIcon: Icons.filter_list,
//                       text: 'Filter',
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 36),
//                 //.......................
//                 Column(
//                   children:
//                       filteredCommanders
//                           .map((card) => CommandersCardWidget(card: card))
//                           .toList(),
//                 ),

//                 ...groupedCommanders.entries.map((entry) {
//                   final letter = entry.key;
//                   final names = entry.value;
//                   return Column(
//                     key: _sectionKeys[letter],
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Text(
//                           letter,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       ...names
//                           .map((name) => ListTile(title: Text(name)))
//                           .toList(),
//                     ],
//                   );
//                 }),
//               ],
//             ),
//           ),
//           // A-Z scroller
//           Positioned(
//             right: 4,
//             top: 60,
//             bottom: 60,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children:
//                   _alphabet.map((letter) {
//                     final enabled = groupedCommanders.containsKey(letter);
//                     return GestureDetector(
//                       onTap: enabled ? () => scrollToLetter(letter) : null,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 1.0),
//                         child: Text(
//                           letter,
//                           style: TextStyle(
//                             fontSize: 10,
//                             color: enabled ? Colors.blue : Colors.grey,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ),

//           Positioned(
//             right: 10,
//             top: 65,
//             bottom: 60,
//             child: Column(
//               children: [
//                 VerticalButtton(
//                   text: 'Top Rated',
//                   onPressed: () => applyFilter('top'),
//                   showIcon: true,
//                   sufixIcon: Icons.arrow_forward,
//                 ),
//                 VerticalButtton(
//                   height: 125,
//                   quarterTurens: 1,
//                   text: 'Lower Rated',
//                   onPressed: () => applyFilter('low'),
//                   showIcon: true,
//                   sufixIcon: Icons.arrow_forward,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:commanderratings/core/widgets/wide_custom_button.dart';
import 'package:commanderratings/features/all_commanders/core/commanders_card.dart';
import 'package:commanderratings/features/all_commanders/presentation/widgets/commanders_card_widget.dart';
import 'package:commanderratings/features/all_commanders/presentation/widgets/filter_buttons_for_commanders.dart';
import 'package:commanderratings/features/all_commanders/presentation/widgets/vertical_buttton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:commanderratings/core/widgets/normal_custom_button.dart';
import 'package:commanderratings/core/widgets/title_with_icon_prefix.dart';
import 'package:commanderratings/features/add_commander/presentation/screens/add_commanders_screen.dart';
import 'package:commanderratings/features/all_commanders/presentation/widgets/customBoxContainer.dart';
import 'package:commanderratings/features/all_commanders/presentation/widgets/title_text_all_commanders.dart';
import '../widgets/service_member_widget.dart';

class AllCommandersScreen extends StatefulWidget {
  const AllCommandersScreen({super.key});

  @override
  State<AllCommandersScreen> createState() => _AllCommandersScreenState();
}

class _AllCommandersScreenState extends State<AllCommandersScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<String> _alphabet = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );
  final Map<String, GlobalKey> _letterKeys = {};

  late List<CommandersCard> allCommanders;
  late List<CommandersCard> filteredCommanders;
  String currentFilter = 'all';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    allCommanders = [
      CommandersCard(
        name: 'Jeffrey Adams',
        designation: '(RET) Air Forces',
        image: 'assets/images/banner/banner_for_commanders_details.png',
        rating: 5.5,
        uploadedTime: '9 Hours Ago',
      ),
      CommandersCard(
        name: 'Mason Black',
        designation: '(RET) Navy',
        image: 'assets/images/banner/banner_for_commanders_details.png',
        rating: 4.2,
        uploadedTime: '2 Days Ago',
      ),
      CommandersCard(
        name: 'Angela Carter',
        designation: '(RET) Army',
        image: 'assets/images/banner/banner_for_commanders_details.png',
        rating: 6.8,
        uploadedTime: '1 Day Ago',
      ),
      CommandersCard(
        name: 'Liam Davis',
        designation: '(RET) Marines',
        image: 'assets/images/banner/banner_for_commanders_details.png',
        rating: 3.7,
        uploadedTime: '5 Hours Ago',
      ),
      CommandersCard(
        name: 'Emma Diaz',
        designation: '(RET) Marines',
        image: 'assets/images/banner/banner_for_commanders_details.png',
        rating: 6.9,
        uploadedTime: '1 Day Ago',
      ),
      CommandersCard(
        name: 'Noah Diaz',
        designation: '(RET) Marines',
        image: 'assets/images/banner/banner_for_commanders_details.png',
        rating: 10.0,
        uploadedTime: '1 Day Ago',
      ),
    ];

    filteredCommanders = List.from(allCommanders);

    final initials =
        filteredCommanders.map((c) => c.name[0].toUpperCase()).toSet();
    for (var letter in initials) {
      _letterKeys[letter] = GlobalKey();
    }
  }

  void applyFilter(String filterType) {
    setState(() {
      currentFilter = filterType;
      List<CommandersCard> matches = List.from(allCommanders);

      if (filterType == 'top') {
        matches.sort((a, b) => b.rating.compareTo(a.rating));
      } else if (filterType == 'low') {
        matches.sort((a, b) => a.rating.compareTo(b.rating));
      }

      if (searchQuery.isNotEmpty) {
        final exactMatches =
            matches
                .where(
                  (card) =>
                      card.name.toLowerCase() == searchQuery.toLowerCase() ||
                      card.designation.toLowerCase() ==
                          searchQuery.toLowerCase(),
                )
                .toList();

        final partialMatches =
            matches
                .where(
                  (card) =>
                      card.name.toLowerCase().contains(
                        searchQuery.toLowerCase(),
                      ) ||
                      card.designation.toLowerCase().contains(
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

  void applySearchFilter(String query) {
    setState(() {
      searchQuery = query;
      applyFilter(currentFilter);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleWithIconPrefix(fontSize: 12, text: 'All commanders'),
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
                const ServiceMemberWidget(),
                const SizedBox(height: 20),
                Customboxcontainer(
                  children: [
                    const TitleTextAllCommanders(text: 'Units'),
                    const SizedBox(height: 10),
                    FilterButtonsForCommanders(
                      onSelectionChanged: (selectedFilters) {
                        if (selectedFilters.isNotEmpty) {
                          applySearchFilter(selectedFilters.first);
                        } else {
                          applyFilter(currentFilter);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    WideCustomButton(
                      showIcon: true,
                      sufixIcon: Icons.filter_list,
                      text: 'Filter',
                      onPressed: () => applyFilter(currentFilter),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Column(
                  children:
                      filteredCommanders.map((card) {
                        String initial = card.name[0].toUpperCase();
                        final key =
                            _letterKeys.containsKey(initial)
                                ? _letterKeys[initial]
                                : null;

                        return Container(
                          key: key,
                          child: CommandersCardWidget(card: card),
                        );
                      }).toList(),
                ),
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
                                    duration: const Duration(milliseconds: 300),
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
                  onPressed: () => applyFilter('top'),
                  showIcon: true,
                  sufixIcon: Icons.arrow_forward,
                ),
                VerticalButtton(
                  height: 125,
                  quarterTurens: 1,
                  text: 'Lower Rated',
                  onPressed: () => applyFilter('low'),
                  showIcon: true,
                  sufixIcon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
