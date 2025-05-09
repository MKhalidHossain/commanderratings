import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';

class ContainerForCommanderDetails extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  const ContainerForCommanderDetails({
    super.key,
    required this.text,
    this.height = 40,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.context(context).borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.context(context).textColor,
          fontFamily: "aero_matics",
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
