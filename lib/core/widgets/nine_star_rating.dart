import 'package:flutter/material.dart';

class NineStarRating extends StatelessWidget {
  final int rating;
  final double starSize;
  final Color activeColor;
  final Color inactiveColor;

  const NineStarRating({
    super.key,
    required this.rating,
    this.starSize = 24.0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(9, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: starSize,
          color: index < rating ? activeColor : inactiveColor,
        );
      }),
    );
  }
}