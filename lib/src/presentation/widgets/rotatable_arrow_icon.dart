import 'package:flutter/material.dart';

class RotatableArrowIcon extends StatelessWidget {
  final Color? color;
  final double? size;
  final int angle;

  const RotatableArrowIcon({
    required this.angle,
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * (3.14159 / 180),
      child: Icon(
        Icons.arrow_forward_ios,
        color: color,
        size: size,
      ),
    );
  }
}
