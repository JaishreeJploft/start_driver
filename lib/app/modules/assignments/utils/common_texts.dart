import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/contanst_colors.dart';
import 'package:stardriver/app/modules/assignments/utils/sizes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'common_sizes.dart';

Widget textArialOverFlow(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        fontFamily: 'Arial'),
  );
}

Widget textArial(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        fontFamily: 'Arial'),
  );
}

Widget textArialLineHeight(String text, double fontSize, Color fontColor,
    FontWeight fontWeight, lineHeight) {
  return Text(
    text,
    textScaleFactor: 1,
    style: TextStyle(
        height: lineHeight,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        fontFamily: 'Arial'),
  );
}

Widget textArialCenter(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        fontFamily: 'Arial'),
  );
}

Widget textArialLeft(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        fontFamily: 'Arial'),
  );
}

Widget textArialUnderline(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        decoration: TextDecoration.underline,
        fontFamily: 'Arial'),
  );
}

Widget textArialCenterExpanded(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    textScaleFactor: 1,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        height: 1.5,
        fontFamily: 'Arial'),
  );
}

Widget textArialExpanded(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        height: 1.5,
        fontFamily: 'Arial'),
  );
}

TextStyle unselectedStyle = TextStyle(
    fontSize: 12, color: StarColors.black6, fontWeight: FontWeight.w400);
TextStyle selectedStyle = TextStyle(
    fontSize: 12, color: StarColors.yellowPrimary, fontWeight: FontWeight.w700);

// newly added for row with image and textSpan
Widget detailRow(icon, title, body) {
  return Row(
    children: [
      icon == '' ? SizedBox.shrink() : SvgPicture.asset(icon),
      spacewidth(1.h),
      textArial(title, 14.sp, ColorConstants.black, FontWeight.w400),
      textArial(
          body, detailValueTs, ColorConstants.primaryColor, FontWeight.w700),
    ],
  );
}

Widget buildTextSpan(icon, title, label) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          spacewidth(1.h),
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: title,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.sp,
                        color: ColorConstants.black,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                    text: label,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
