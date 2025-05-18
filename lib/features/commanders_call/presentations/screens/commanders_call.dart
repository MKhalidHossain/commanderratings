
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/headers/header_for_others_one_man.dart';
import '../../../commanders/domain/leadership_card_model.dart';
import '../widgets/filter_buttons.dart';
import '../widgets/leadership_card_widget.dart';
import 'call_of_commander.dart';



class CommandersCall extends StatefulWidget {
  const CommandersCall({super.key});

  @override
  State<CommandersCall> createState() => _CommandersCallState();
}

class _CommandersCallState extends State<CommandersCall> {
  final List<LeadershipCard> leadershipCards = [
    LeadershipCard(
      imageUrl: 'https://picsum.photos/id/1011/400/180',
      centerText: 'ENLISTED PERSPECTIVE',
      title:
          'THE ARGUMENT FOR MANDATORY ENLISTED SERVICE IN THE U.S MILITARY PRIOR TO OFFICER CORPS ACCEPTANCE',
    ),
    LeadershipCard(
      imageUrl: 'https://picsum.photos/id/1012/400/180',
      centerText: 'MEDICATION & LEADERSHIP',
      title:
          'PILLS ANO POWER NAVIGATING LEADERSHIP IN THE US. MILITARY UNDER MEDICATIOWS INFLUENCE',
    ),
    LeadershipCard(
      imageUrl: 'https://picsum.photos/id/1013/400/180',
      centerText: 'MILITARY LEADERSHIP',
      title:
          'HOW MILITARY COMMANDERS SHAME MENTAL HEALTH SEEKERS ANO FUEL THE CRISIS',
    ),
    LeadershipCard(
      imageUrl: 'https://picsum.photos/id/1015/400/180',
      centerText: 'CONGRESSIONAL & SENATORIAL ASSISTANCE',
      title:
          'THE ARGUMENT FOR MANDATORY ENLISTED SERVICE IN THE U.S MILITARY PRIOR TO OFFICER CORPS ACCEPTANCE',
    ),
    LeadershipCard(
      imageUrl: 'https://picsum.photos/id/1016/400/180',
      centerText: 'PSYCHOLOGY OF LEADERSHIP',
      title:
          'HOW MILITARY COMMANDERS SHAME MENTAL HEALTH SEEKERS ANO FUEL THE CRISIS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderForOthers(text: 'Commanders Call'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilterButtons(
                onSelectionChanged: (selectedFilters) {
                  print("Selected: $selectedFilters");
                },
              ),
            ), // Horizontal filter button list
            const SizedBox(height: 10),
            // Expanded(
            //   child: ListView.builder(
            //     padding: const EdgeInsets.all(12),
            //     itemCount: leadershipCards.length,
            //     itemBuilder: (context, index) {
            //       return LeadershipCardWidget(card: leadershipCards[index]);
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: List.generate(
                  leadershipCards.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Get.to(CallOfCommnder());
                    },
                    child: LeadershipCardWidget(card: leadershipCards[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
