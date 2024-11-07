import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/rotatable_arrow_icon.dart';

class HalfCircleWithArrow extends StatelessWidget {
  final bool isAppBarExpanded;

  const HalfCircleWithArrow({required this.isAppBarExpanded, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: HalfCircleClipper(),
          child: Container(
            width: 60,
            height: 60,
            color: Colors.greenAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: RotatableArrowIcon(
            angle: isAppBarExpanded ? 90 : 270,
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height / 2);
    path.arcToPoint(
      Offset(size.width, size.height / 2),
      radius: Radius.circular(size.width / 2),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
