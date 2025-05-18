import 'package:flutter/material.dart';

class ButtionForSeviceBranches extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double weight;
  final double fontSize;
  final Color textColor;
  final Color fillColor;

  const ButtionForSeviceBranches({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 30,
    this.weight = 70,
    this.fontSize = 12,
    this.textColor = Colors.white,
    this.fillColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: weight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: fillColor, // Make it red like in your design
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize),
        ),
      ),
    );
  }
}
