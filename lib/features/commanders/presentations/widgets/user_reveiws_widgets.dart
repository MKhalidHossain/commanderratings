import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ratting_a_to_z/ratting.dart';
import '../../../../../core/widgets/lebel_and_value_text.dart';

class UserReveiwsWidgets extends StatefulWidget {
  const UserReveiwsWidgets({super.key});

  @override
  State<UserReveiwsWidgets> createState() => _UserReveiwsWidgetsState();
}

class _UserReveiwsWidgetsState extends State<UserReveiwsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(text: 'User Reviews'),
        // const SizedBox(height: 4.0),
        Divider(color: Colors.grey, thickness: 1),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              color: AppColors.context(context).iconOutsideFillColor,
              child: Icon(
                Icons.person_outline,
                size: 30,
                color: AppColors.context(context).iconColor,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(text: 'SecFeba'),
                  ValueTextAeroMatics(
                    text: 'A commander who violates hos own regulation',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              ValueTextAeroMatics(text: 'Overall'),
              const SizedBox(height: 32.0),
              ShowRating(rating: 5.5),
              const SizedBox(height: 8),
              ValueTextAeroMatics(text: '5.5'),
              const SizedBox(height: 8.0),
              ValueTextAeroMatics(
                text:
                    'Tactical Competence: Now Effectively Does the commander make operational decisions during Mission: Or Exercise? Are they tactically sound and capable of leading during high pressure Solution',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
