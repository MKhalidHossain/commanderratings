import 'package:flutter/material.dart';

class TitleTextAllCommanders extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const TitleTextAllCommanders({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.red,
        fontFamily: 'aero_matics',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
