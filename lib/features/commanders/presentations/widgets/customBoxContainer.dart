import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';

class Customboxcontainer extends StatelessWidget {
  final List<Widget> children;
  final double width;
  const Customboxcontainer({
    super.key,
    required this.children,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.context(context).contentBoxGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
