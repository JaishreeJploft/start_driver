import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class Custom_FilterDropDown extends StatelessWidget {
  String? initialValue;
  String hintText;
  List<String> listData;
  String icon;
  Function(dynamic value) onChange;
  Custom_FilterDropDown({Key? key, required this.initialValue,required this.hintText,
    required this.listData,required this.onChange,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 4.h,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                  isExpanded: true,
                  isDense: true,
                  // iconStyleData: IconStyleData(
                  //   icon: Icon(Icons.arrow_drop_down, color: ColorConstants.black,),
                  // ),
                  // dropdownStyleData: DropdownStyleData( offset: Offset(0,-10),),
                  //menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 2.h),),
                  value: initialValue,
                  alignment: AlignmentDirectional.centerStart,
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.8.h,),
                    child: addText(hintText, 14.sp,ColorConstants.black, FontWeight.w700),
                  ),
                  items: listData.map((String data) {
                    return DropdownMenuItem(
                      value: data,
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.8.h,),
                        child: addText(data, 14.sp, Colors.black,FontWeight.w700),
                      ),);
                  }).toList(),
                  onChanged: onChange),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: SvgPicture.asset(
                  icon,
                  height: 2.h,
                  width: 2.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
