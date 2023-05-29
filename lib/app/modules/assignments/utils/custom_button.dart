import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/contanst_colors.dart';

class CustomButton extends StatelessWidget {
  Color? color;
  Gradient? gradient;
  double? height;
  double? width;
  BorderRadiusGeometry? borderRadius;
  Widget child;
  Function() onTap;
  Color? borderColor;
  CustomButton(
      {Key? key,
      this.color,
      this.height,
      this.width,
      this.gradient,
      this.borderRadius,
      required this.child,
      required this.onTap,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[3],
        gradient: gradient,
        color: color ?? StarColors.yellowSecondary,
        border: Border.all(color: borderColor ?? StarColors.yellowPrimary),
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(19),
            ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(19)),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: width ?? 200,
            height: height ?? 6.5.h,
            child: child,
          ),
        ),
      ),
    );
  }
}
