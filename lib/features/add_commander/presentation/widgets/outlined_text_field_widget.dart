import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String lebel;
  final TextInputType textInputType;
  final String textFieldHeaderName;

  const OutlinedTextFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    required this.lebel,
    required this.textInputType,
    required this.textFieldHeaderName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldHeaderName,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.context(context).textColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 7),
        TextField(
          
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: lebel,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
