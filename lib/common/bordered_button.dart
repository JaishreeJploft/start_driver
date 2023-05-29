import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

// ignore: must_be_immutable
class BorderedButton extends StatelessWidget {
  double width;
  String text;

  BorderedButton({Key? key, required this.width, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // width: width,
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 8.w),
          decoration: BoxDecoration(
              color: ColorConstants.primaryColorLight,
              boxShadow: [getDeepBoxShadow()],
              border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
              borderRadius: getCustomBorderRadius(19)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: addText(text, 17.sp,
                  ColorConstants.primaryColor, FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
