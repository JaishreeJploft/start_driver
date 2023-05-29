import 'package:flutter/material.dart';
import 'package:stardriver/common/utils.dart';

import 'color_constants.dart';

// ignore: must_be_immutable
class EdgyBorderedButton extends StatelessWidget {
  double width;
  String text;

  EdgyBorderedButton({Key? key, required this.width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: ColorConstants.primaryColorLight,
          boxShadow: [getDeepBoxShadow()],
          border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
          borderRadius: getEdgyBorderRadius()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Center(
          child: addText(text, getNormalTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.bold),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EdgyBorderedButtonOutline extends StatelessWidget {
  double width;
  String text;

  EdgyBorderedButtonOutline({Key? key, required this.width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: ColorConstants.white,
          border: Border.all(color: ColorConstants.buttonbgcolor, width: 1),
          borderRadius: getEdgyBorderRadius()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Center(
          child: addText(text, getNormalTextFontSIze(),
              ColorConstants.buttonbgcolor, FontWeight.bold),
        ),
      ),
    );
  }
}
