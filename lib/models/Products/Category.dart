import 'package:flutter/material.dart' show Color, LinearGradient;

class CategoryModel {
  final String title;
  final String subtitle;
  final String url;
  final double bottomImage;
  final double rightImage;
  final double widthImage;
  final LinearGradient backgroundColor;
  final Color mainColor;
  final bool rotate;

  CategoryModel({
    this.mainColor,
    this.bottomImage,
    this.rightImage,
    this.widthImage,
    this.title,
    this.subtitle,
    this.url,
    this.backgroundColor,
    this.rotate = false,
  });
}
