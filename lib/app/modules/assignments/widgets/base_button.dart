import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/sizes.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final double? textSize;
  final double? verticalPadding;
  final double borderRadius;
  final bool isActive;
  final bool showNextIcon;
  final bool removeHorizontalPadding;
  final bool isToggle;
  final String btnType;
  final Function()? onPressed;
  const BaseButton(
      {Key? key,
      required this.title,
      this.textSize,
      required this.onPressed,
      this.isActive = true,
      this.showNextIcon = false,
      this.removeHorizontalPadding = false,
      this.verticalPadding,
      this.isToggle = false,
      required this.btnType,
      this.borderRadius = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (btnType) {
      case "small":
        return showButtonType(
            context, false, 0.7.h, 20.w, smallButtonTs, borderRadius);
      case "medium":
        return showButtonType(
            context, false, 1.3.h, 30.w, mediumButtonTs, borderRadius);
      case "large":
        return showButtonType(
            context, showNextIcon, 1.7.h, 50.w, largeButtonTs, borderRadius);
      case "togglelarge":
        return showButtonType(
            context, showNextIcon, 1.3.h, 50.w, mediumButtonTs, borderRadius);
      default:
        return showButtonType(context, showNextIcon, 1.7.h, double.infinity,
            largeButtonTs, borderRadius);
    }
  }

  showButtonType(context, showNextIcon, double verticalPadding, double btnWidth,
      double fontSize, double borderRadius) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: removeHorizontalPadding ? 0 : 4.w,
            vertical: verticalPadding),
        width: btnWidth,
        decoration: BoxDecoration(
            color: isActive
                ? !showNextIcon
                    ? Color(0xffF8F4E9)
                    : Colors.white
                : Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: isActive
                ? !showNextIcon
                    ? const [
                        BoxShadow(
                            color: Color(0xffA59F9F),
                            spreadRadius: 0.5,
                            blurRadius: 1.0,
                            offset: Offset(0, 2))
                      ]
                    : null
                : null,
            border: isToggle
                ? null
                : Border.all(
                    color: isActive ? Color(0xffC19444) : Color(0xffE2E2E2))),
        child: showNextIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontFamily: "Arial",
                          fontWeight: FontWeight.w400,
                          fontSize: fontSize,
                          color: isActive
                              ? Color(0xffC19444)
                              : Color(0xffB4B9C1))),
                  Icon(
                    Icons.arrow_forward,
                    color: Color(0xffC19444),
                    size: 20.sp,
                  )
                ],
              )
            : Text(title,
                style: TextStyle(
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                    color: isActive ? Color(0xffC19444) : Color(0xffB4B9C1))),
      ),
    );
  }
}
