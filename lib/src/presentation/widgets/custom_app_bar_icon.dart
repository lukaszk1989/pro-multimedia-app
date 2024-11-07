import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isExpanded;

  const CustomAppBarIcon(
      {super.key, required this.icon, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white.withOpacity(isExpanded ? 0.5 : 0),
        ),
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
      ],
    );
  }
}
