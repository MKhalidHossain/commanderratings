import 'package:commanderratings/core/widgets/title_subtitle_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/headers/header_for_others_one_man.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderForOthers(text: 'About'),
            const SizedBox(height: 24),
            Row(
              children: [
                const SizedBox(width: 24),
                // Container(width: 2, height: 600, color: Colors.red[500]),
                // const SizedBox(width: 15),
                Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.red[500]!, width: 2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TitleText(
                          text: 'MILITARY LEADERSHIP AND ACCOUNTABILITY',
                        ),
                        const SizedBox(height: 8),
                        SubTitleText(
                          text:
                              'Military leadership often champions transparency as a hallmark of effective command. Yet, in reality, the officer corps often operates like an exclusive club—a “good ol’ boy” network with little accountability. The uncomfortable truth is that officers often protect one another.',
                        ),
                        const SizedBox(height: 8),
                        SubTitleText(
                          text:
                              'Commanders only hold one another accountable when misconduct becomes public, forcing higher-ups to intervene.',
                        ),
                        const SizedBox(height: 32),
                        TitleText(
                          text:
                              'THE PROBLEM WITH “DIFFERENT SPANKS FOR DIFFERENT RANKS',
                        ),
                        const SizedBox(height: 8),
                        SubTitleText(
                          text:
                              'The outdated mindset of “different spanks for different ranks” epitomizes toxic leadership. If an officer gets a DUI, their punishment should match that of a lower-enlisted member because the standards should apply equally to all military personnel. The idea that rank diminishes accountability is flawed and perpetuates an environment where leaders—who need accountability the most—are left unchecked.',
                        ),
                        const SizedBox(height: 32),
                        TitleText(text: 'WHY COMMANDER RATINGS WAS CREATED'),
                        const SizedBox(height: 8),
                        SubTitleText(
                          text:
                              'Commander Ratings was created to provide military personnel a secure platform to voice concerns about their leadership, without the risk of retaliation. It gives higher leadership an unfiltered view of commander effectiveness, straight from those most impacted by it. It allows you, the user, to see how others view a commander and identify the negatives or positives of their command.',
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
