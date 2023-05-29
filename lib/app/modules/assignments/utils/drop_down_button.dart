import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/assets.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import 'constant_images.dart';

class MyDropDownButtonFormField extends StatefulWidget {
  final String title, hint, errorMsg;
  final List<DropDownButtonsModel> dropDown;
  // final TextEditingController controller;
  final bool isEnbale;
  final double topPadding, bottomPadding;
  String dropvalue;

  MyDropDownButtonFormField({
    Key? key,
    required this.dropDown,
    required this.title,
    // required this.controller,
    required this.hint,
    this.errorMsg = "This field is required.",
    this.isEnbale = true,
    this.topPadding = 15,
    this.bottomPadding = 20,
    this.dropvalue = "",
  }) : super(key: key);

  @override
  State<MyDropDownButtonFormField> createState() =>
      _MyDropDownButtonFormFieldState();
}

class _MyDropDownButtonFormFieldState extends State<MyDropDownButtonFormField> {
  @override
  Padding build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.title != ""
              ? Container(
                  child: addText(
                      widget.title, 16.sp, Colors.black, FontWeight.w700),
                  width: MediaQuery.of(context).size.width * 0.18,
                )
              : SizedBox.shrink(),
          widget.title != ""
              ? SizedBox(
                  width: 5,
                )
              : SizedBox.shrink(),
          Expanded(
            child: DropdownButtonFormField<String>(
              dropdownColor: ColorConstants.primaryColorLight,
              borderRadius: BorderRadius.circular(4),
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConstants.primaryColorLight,
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: ColorConstants.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBECADA))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBECADA))),
                isDense: true,
                contentPadding:
                    EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 8),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 25,
                ),
              ),
              hint: Text(
                widget.hint,
                style: TextStyle(
                    fontSize: getNormalTextFontSIze(),
                    color: ColorConstants.black,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(
                  fontSize: getNormalTextFontSIze(),
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w400),
              icon: SvgPicture.asset(Assets.imagesDropDownArrow),
              items: widget.dropDown
                  .map(
                    (e) => DropdownMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.name),
                          //   widget.dropvalue == ""
                          //       ? SvgPicture.asset(StarIcons.checkButtonUnFilled)
                          //       : SizedBox.shrink()
                        ],
                      ),
                      value: e.name,
                    ),
                  )
                  .toList(),
              // onChanged: isEnbale ? (val) => controller.text = val! : null,
              onChanged: (value) {},
              validator: (val) {
                // if (controller.text.isEmpty) return errorMsg;
                // return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownButtonsModel {
  final String id, name;
  DropDownButtonsModel(this.id, this.name);
}
