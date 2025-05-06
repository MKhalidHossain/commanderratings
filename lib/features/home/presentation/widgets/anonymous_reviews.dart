import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:commanderratings/core/widgets/title_subtitle_text.dart';
import 'package:commanderratings/core/widgets/wide_custom_button.dart';
import 'package:flutter/material.dart';

class AnonymousReviewsBanner extends StatelessWidget {
  const AnonymousReviewsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: AppColors.context(context).contentBoxGreyColor,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(text: 'FAIR & ANONYMOUS REVIEWS'),
                  const SizedBox(height: 8),
                  SubTitleText(
                    text:
                        'We ensure all reviews are anonymous and verified to protect service members while maintaining integrity.',
                  ),

                  const SizedBox(height: 16),
                  WideCustomButton(text: 'SEE HOW IT WORKS', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
