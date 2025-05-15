import 'package:flutter/material.dart';

class VerticalButtton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double weight;
  final double fontSize;
  final Color textColor;
  final Color fillColor;
  final bool showIcon;
  final IconData? sufixIcon;
  final int quarterTurens;
  const VerticalButtton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 110,
    this.weight = 45,
    this.fontSize = 12,
    this.textColor = Colors.white,
    this.fillColor = Colors.red,
    this.showIcon = false,
    this.sufixIcon,
    this.quarterTurens = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: fillColor, // Make it red like in your design
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        ),
        onPressed: onPressed,
        child: RotatedBox(
          quarterTurns: quarterTurens,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
                if (showIcon && sufixIcon != null) ...[
                  const SizedBox(width: 5),
                  Icon(sufixIcon, color: Colors.white),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
