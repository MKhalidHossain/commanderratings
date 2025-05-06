import 'package:flutter/material.dart';

import '../../../../../core/widgets/title_subtitle_text.dart';
import '../../../../../core/headers/header_for_others_one_man.dart';

class LawEnforcement extends StatelessWidget {
  const LawEnforcement({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HeaderForOthers(text: 'Law Enforcement'),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 10),
                // Container(
                //   constraints: BoxConstraints(: double.infinity),
                //   width: 2, color: Colors.red[500]),
                const SizedBox(width: 15),
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
                      children: [
                        const SizedBox(height: 10),

                        SubTitleText(
                          text:
                              'Commander Ratings is a community-driven platform dedicated to bringing much-needed accountability to military leadership. We prioritize transparency in everything we do. We do not retain any personal information from users who leave ratings. This includes names, ranks, locations, or branches of service. Additionally, we do not collect or store IP addresses, email addresses, or phone numbers. All comments on Commander Ratings are moderated for content, and any claims of serious misconduct must be supported by documentation. However, we do not retain this documentationonce verified, it is immediately deleted. Commander Ratings maintains no records that could identify its users or any other personal data. We are committed to protecting your privacy. While some claims may require further investigation by agencies such as CID, NCIS, OSI, or S2I, we cannot assist in investigations due to our commitment to privacy. Therefore, we encourage you to contact the individual being rated or their command directly for any inquiries or concerns regarding information posted on this platform.',
                          color: Colors.white,
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
