import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/utils.dart';


import 'color_constants.dart';

class CustomRadioButton extends StatelessWidget {
  String radiovalue;
  String groupValue;
  String radioText;
  Function(dynamic value) onChange;
  CustomRadioButton({Key? key,required this.onChange,required this.groupValue,required this.radiovalue,required this.radioText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 2.h,
          width: 2.h,
          child: Radio(
            value: radiovalue,
            activeColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
            fillColor:
            MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
            groupValue: groupValue,
            onChanged: onChange,
          ),
        ),
        SizedBox(width: 0.7.h,),
        addText(radioText, 14, Colors.black, FontWeight.w400)
      ],
    );
  }
}
