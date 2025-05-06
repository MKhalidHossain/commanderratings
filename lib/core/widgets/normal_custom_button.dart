import 'package:flutter/material.dart';

class NormalCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double weight;
  final double fontSize;

  const NormalCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.weight = 200,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: height,
      width: weight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Make it red like in your design
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
