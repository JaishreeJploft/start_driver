import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/common_sizes.dart';
import 'package:stardriver/app/modules/assignments/utils/common_texts.dart';
import 'package:stardriver/app/modules/assignments/utils/contanst_colors.dart';


Widget backButton(ontap) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 6.sp),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    height: 35.sp,
    width: 35.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.sp),
        onTap: ontap,
        child: Icon(
          CupertinoIcons.back,
          color: Colors.black,
          size: 22.sp,
        ),
      ),
    ),
  );
}

Widget iconButton(ontap, icon) {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 6.sp),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    // height: 20.sp,
    // width: 20.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
            height: 30,
          )),
    ),
  );
}

Widget iconButtonDynamic(ontap, icon, height) {
  return Container(
    // margin: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 6.sp),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    // height: 20.sp,
    // width: 20.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
            height: height,
          )),
    ),
  );
}

Widget sendOTPButton(ontap) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 8.sp),
    decoration: BoxDecoration(
        color: StarColors.otpButtonColor,
        borderRadius: BorderRadius.circular(7)),
    height: 23,
    width: 75,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: ontap,
          child: Container(
            alignment: Alignment.center,
            child: textArial('SEND OTP', 11, Colors.white, FontWeight.w700),
          )),
    ),
  );
}

Widget editButton(ontap) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: StarColors.yellowPrimary),
        color: StarColors.yellowSecondary,
        borderRadius: BorderRadius.circular(19)),
    height: 20,
    width: 59,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(19),
          onTap: ontap,
          child: Container(
            alignment: Alignment.center,
            child: textArial(
                'EDIT', 12, StarColors.yellowPrimary, FontWeight.w700),
          )),
    ),
  );
}

Widget textButton({required Widget child, required Function() onTap}) {
  return Align(
    alignment: Alignment.center,
    child: InkWell(
      borderRadius: BorderRadius.circular(8.sp),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: child,
      ),
    ),
  );
}

Widget checkBoxButton(ontap, icon) {
  return SizedBox(
    // width: 25.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(20.sp),
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
          )),
    ),
  );
}

Widget notificationToogleButton(onTap1, isSchool, onTap2, isTransportaion) {
  return Row(
    children: [
      Expanded(
        child: InkWell(
          borderRadius: radiusAll(8),
          onTap: onTap1,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color:
                        isSchool ? Colors.transparent : StarColors.borderColor),
                color:
                    isSchool ? StarColors.yellowSecondary : StarColors.white2,
                borderRadius: radiusAll(8),
                boxShadow: isSchool ? kElevationToShadow[3] : null),
            child: isSchool
                ? textArial(
                    'School', 14, StarColors.yellowPrimary, FontWeight.w700)
                : textArial('School', 14, StarColors.grey2, FontWeight.w400),
          ),
        ),
      ),
      spacewidth(0.7.h),
      Expanded(
        child: InkWell(
          borderRadius: radiusAll(8),
          onTap: onTap2,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                boxShadow: isTransportaion ? kElevationToShadow[3] : null,
                color: isTransportaion
                    ? StarColors.yellowSecondary
                    : StarColors.white2,
                borderRadius: radiusAll(8),
                border: Border.all(
                    color: isTransportaion
                        ? Colors.transparent
                        : StarColors.borderColor)),
            child: isTransportaion
                ? textArial('Transportation', 14, StarColors.yellowPrimary,
                    FontWeight.w700)
                : textArial(
                    'Transportation', 14, StarColors.grey2, FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}
