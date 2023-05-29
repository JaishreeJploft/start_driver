import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';



class BaseDetailData extends StatelessWidget {
  final String icon;
  final String detailsLable;
  final String detailsValue;

  const BaseDetailData(
      {Key? key,
        this.icon = "",
        required this.detailsLable,
        this.detailsValue = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            if (icon != "")
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: SvgPicture.asset(
                    icon,
                    height: 2.h,
                    width: 2.h,
                  ),
                ),
              ),
            TextSpan(
                text: "${detailsLable} ",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )),
            if (detailsValue != "")
              TextSpan(
                text: " :  $detailsValue",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.sp,
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
