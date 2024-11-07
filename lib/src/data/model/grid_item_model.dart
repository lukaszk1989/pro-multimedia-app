import 'package:flutter/material.dart';

class GridItemModel {
  final String title;
  final String? image;
  final Widget? rightTopIcon;
  final Widget? leftTopIcon;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;

  GridItemModel(
      {required this.title,
      this.height,
      this.image,
      this.rightTopIcon,
      this.leftTopIcon,
      this.backgroundColor,
      this.textColor});
}
