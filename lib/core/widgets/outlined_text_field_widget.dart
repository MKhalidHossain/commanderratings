import 'package:commanderratings/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool isLable;
  // final String? lebel;
  final TextInputType textInputType;
  final String textFieldHeaderName;

  const OutlinedTextFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    this.isLable = false,
    // this.lebel,
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
            color: Colors.grey.shade500,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 7),
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            style: TextStyle(color: AppColors.context(context).textColor),
            decoration: InputDecoration(
              // labelText: isLable && lebel != null ? lebel : null,

              //labelText: lebel,
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade500, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
