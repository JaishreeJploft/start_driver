import 'package:flutter/material.dart';

EdgeInsets marginSymetric(double horizontal, double vertical) {
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

BorderRadius radiusAll(double radius) {
  return BorderRadius.circular(radius);
}

BorderRadius radiusTop(double rightTop, double leftTop) {
  return BorderRadius.only(
      topRight: Radius.circular(rightTop), topLeft: Radius.circular(leftTop));
}

SizedBox spaceheight(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox spacewidth(double width) {
  return SizedBox(
    width: width,
  );
}
