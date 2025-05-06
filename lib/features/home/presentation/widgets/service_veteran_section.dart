import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/title_subtitle_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/wide_custom_button.dart';

class ServiceVeteranSection extends StatelessWidget {
  const ServiceVeteranSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: AppColors.context(context).contentBoxColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: 'FOR SERVICE MEMBERS & VETERANS',
              color: AppColors.context(context).textColor,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 85,
                  height: 85,
                  color: Colors.grey[300],
                  // decoration: BoxDecoration(
                  //   color: AppColors.context(context).contentBoxColor,
                  // ),
                ), // Placeholder
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: "WHY REVIEWS MATTER",
                        color: AppColors.context(context).textColor,
                      ),
                      const SizedBox(height: 4),
                      SubTitleText(
                        text:
                            'Fair and anonymous reviews help service members make better choices.',
                        color: AppColors.context(context).textColor,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'LEARN MORE',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.context(context).contentBoxGreyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UNDERSTANDING LEADERSHIP IMPACT",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  SubTitleText(
                    text: "Your feedback helps continuously uplift and correct our military services.",
                  ),
                  const SizedBox(height: 10),
                  WideCustomButton(
                    text: "GET THE LATEST REVIEWS",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
