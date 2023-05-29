import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/utils.dart';

import 'color_constants.dart';

class DetailsRow extends StatelessWidget {
  final String icon;
  String detailsLabel;
  String detailsValue;

  DetailsRow({Key? key,this.icon="",required this.detailsLabel,required this.detailsValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        icon != ""?Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(icon,height: 2.h,width: 2.h,),
            SizedBox(width: 0.8.h,),
          ],
        ):const SizedBox.shrink(),
        addText("$detailsLabel  ", 14, Colors.black, FontWeight.w400),
        detailsValue != "" ?addText(":  $detailsValue", 14, ColorConstants.primaryColor, FontWeight.w700):const SizedBox.shrink()
      ],
    );
  }
}
