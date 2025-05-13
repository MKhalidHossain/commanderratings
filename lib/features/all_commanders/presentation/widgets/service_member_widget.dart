import 'package:flutter/material.dart';

import 'buttion_for_sevice_branches.dart';
import 'customBoxContainer.dart';
import 'title_text_all_commanders.dart';


class ServiceMemberWidget extends StatelessWidget {
  const ServiceMemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Customboxcontainer(
      children: [
        TitleTextAllCommanders(text: 'Service Member'),
        const SizedBox(height: 10),
        Row(
          children: [
            ButtionForSeviceBranches(
              weight: (size.width - 100) * 0.224,
              text: 'Air Force',
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            ButtionForSeviceBranches(
              weight: (size.width - 100) * 0.222,
              text: 'Army',
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            ButtionForSeviceBranches(
              weight: (size.width - 100) * 0.222,
              text: 'Navy',
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            ButtionForSeviceBranches(
              weight: (size.width - 100) * 0.240,
              text: 'US Marines',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
