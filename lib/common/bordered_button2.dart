import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

// ignore: must_be_immutable
class BorderedButton2 extends StatelessWidget {
  final double? horizontalPadding;
  String text;

  BorderedButton2({Key? key, required this.text, this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: horizontalPadding??5.w),
      decoration: BoxDecoration(
          color: ColorConstants.primaryColorLight,
          boxShadow: [getDeepBoxShadow()],
          border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
          borderRadius: getCurvedBorderRadius()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding??20),
        child: Center(
          child: addText(text, getSubheadingTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.w500),
        ),
      ),
    );
  }
}
