import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

// ignore: must_be_immutable
class CircularBorderedButton extends StatelessWidget {
  double width;
  String text;
  final double? horizontalPadding;
  final bool capFirst;
  final bool isActive;


  CircularBorderedButton({
    Key? key,
    required this.width,
    required this.text,
    this.horizontalPadding,
    this.capFirst = true,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10.w),
          decoration: BoxDecoration(
              color: isActive ? Color(0xffF8F4E9) :Colors.white,
              boxShadow: [getDeepBoxShadow()],
              border:
    Border.all(color: isActive ? Color(0xffC19444) :  Color(0xFFBECADA),width: 1.5),
              borderRadius: getBorderRadiusCircular()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Center(
              child: addText(
                   text ?? '',
                  getSubheadingTextFontSIze(),
                isActive ? Color(0xffC19444) : Color(0xff7B8D9E),
                isActive?FontWeight.w700:FontWeight.w400,),
            ),
          ),
        ),
      ],
    );
  }
}
