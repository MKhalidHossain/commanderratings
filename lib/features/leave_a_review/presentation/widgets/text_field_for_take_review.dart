import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';

class TextFieldForTakeReview extends StatefulWidget {
  final double height;
  final TextEditingController controller;
  final String hintText;
  const TextFieldForTakeReview({
    super.key,
    this.height = 50,
    required this.hintText,
    required this.controller,
  });

  @override
  State<TextFieldForTakeReview> createState() => _TextFieldForTakeReviewState();
}

class _TextFieldForTakeReviewState extends State<TextFieldForTakeReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.context(context).borderColor),
        color: AppColors.context(context).contentBoxGreyColor,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.topLeft,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
        ),
        maxLines: null,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
