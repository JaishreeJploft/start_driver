import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }

  return Color(int.parse(hexColor, radix: 16));
}

Widget svgImage(image) {
  return SvgPicture.asset(
    image,
  );
}
