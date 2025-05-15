import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';

class ContainerForCommanderDetails extends StatelessWidget {
  final String text;
  final double height;

  const ContainerForCommanderDetails({
    super.key,
    required this.text,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.context(context).smallContainerColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.context(context).borderColor),
      ),
      child: Text(
        maxLines: 3,
        text,
        style: TextStyle(
          color: AppColors.context(context).textColor,
          fontFamily: "aero_matics",
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
