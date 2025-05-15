import 'dart:math' as math;

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
  final Map<String, GlobalKey> _sectionKeys = {};

  //...............................for scroollable alpabets ..............................
  final List<String> _alphabet = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );

  final Map<String, List<String>> groupedCommanders = {
    'A': ['Anderson', 'Ames'],
    'B': ['Baker', 'Bryant'],
    'C': ['Clark', 'Carter'],
    'd': ['Davis', 'Diaz'],
    // Add more...
  };
  final List<CommandersCard> commandersCards = [
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
    CommandersCard(
      name: 'Jeffrey Adams',
      designation: '(RET) Air Forces',
      image: 'assets/images/banner/banner_for_commanders_details.png',
      rating: 5.5,
      uploadedTime: '9 Hours Ago',
    ),
  ];

  @override
  void initState() {
    super.initState();
    for (var letter in groupedCommanders.keys) {
      _sectionKeys[letter] = GlobalKey();
    }
  }

  void scrollToLetter(String letter) {
    final context = _sectionKeys[letter]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
                  Get.to(() => AddCommandersScreen());
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
                ServiceMemberWidget(),
                const SizedBox(height: 20),
                Customboxcontainer(
                  children: [
                    TitleTextAllCommanders(text: 'Units'),
                    const SizedBox(height: 10),
                    FilterButtonsForCommanders(
                      onSelectionChanged: (selectedFilters) {
                        print("Selected: $selectedFilters");
                      },
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
                //.......................
                Column(
                  children: List.generate(
                    commandersCards.length,
                    (index) =>
                        CommandersCardWidget(card: commandersCards[index]),
                  ),
                ),

                ...groupedCommanders.entries.map((entry) {
                  final letter = entry.key;
                  final names = entry.value;
                  return Column(
                    key: _sectionKeys[letter],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...names
                          .map((name) => ListTile(title: Text(name)))
                          .toList(),
                    ],
                  );
                }),
              ],
            ),
          ),
          // A-Z scroller
          Positioned(
            right: 4,
            top: 60,
            bottom: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  _alphabet.map((letter) {
                    final enabled = groupedCommanders.containsKey(letter);
                    return GestureDetector(
                      onTap: enabled ? () => scrollToLetter(letter) : null,
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
  }
}
