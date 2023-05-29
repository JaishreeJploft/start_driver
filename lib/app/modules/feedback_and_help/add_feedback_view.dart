import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/add_feedback_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AddFeedbackView extends GetView<AddFeedbackController> {
  const AddFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: controller.isEdit ? 'Edit' : 'Feedback & Help',
          )),
      //Spacer
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor),
                  color: ColorConstants.primaryColorLight),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: buildSchoolDropDown(
                  controller.schoolItems, controller.selectedSchool, 'Hint'),
            ),

            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              decoration: getEditTextDecoration(),
              child: buildDropDown(
                  controller.typeItems, controller.selectedType, 'Select Type'),
            ),
            // SizedBox(height: 2.h,),
            // Container(
            //   width: 100.w,
            //   decoration: getEditTextDecoration(),
            //   child: buildDropDown(controller.optionsList, controller.selectedWho, 'Select Type'),
            // ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: getEditTextDecoration(),
              child: addSmallEditText(controller.titleController!, 'Title'),
            ),

            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: getEditTextDecoration(),
              child:
                  buildLineEditText(controller.messageController!, 'Message'),
            ),

            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: getEditTextDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Upload file or Photo', getNormalTextFontSIze(),
                      ColorConstants.gretTextColor, FontWeight.normal),
                  SvgPicture.asset('assets/images/ic_upload.svg')
                ],
              ),
            ),

            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {},
              child: BorderedButton(width: 40.w, text: 'SUBMIT'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSchoolDropDown(
      List<String> list, RxString selectedValue, String hint) {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: addText(hint, getNormalTextFontSIze(),
                  ColorConstants.gretTextColor, FontWeight.normal),
              items: list
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: getNormalTextFontSIze(),
                            fontWeight: FontWeight.normal,
                            color: ColorConstants.gretTextColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              // value: selectedValue.value,
              value:
                  selectedValue.value.isNotEmpty ? selectedValue.value : null,
              onChanged: (value) {
                selectedValue.value = value.toString();
              },
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                size: getLargeTextFontSIze() * 1.5,
                color: ColorConstants.lightTextColor,
              ),
              iconSize: 14,
              iconEnabledColor: ColorConstants.gretTextColor,
              iconDisabledColor: Colors.grey,
              buttonWidth: 80.w,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 78.w,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              dropdownElevation: 1,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              // offset: const Offset(-20, 0),
            ),
          )),
    );
  }

  Widget buildDropDown(List<String> list, RxString selectedValue, String hint) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2(
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
            hint: Text(
              hint.tr,
              style: TextStyle(
                  fontSize: getNormalTextFontSIze(),
                  color: ColorConstants.gretTextColor),
            ),
            items: list
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: getNormalTextFontSIze(),
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue.value.isNotEmpty ? selectedValue.value : null,
            onChanged: (value) {
              selectedValue.value = value as String;
            },
            iconSize: 30,
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              size: getLargeTextFontSIze() * 1.5,
              color: ColorConstants.lightTextColor,
            ),
            buttonWidth: 100.w,
            dropdownElevation: 1,
            dropdownDecoration: BoxDecoration(
              color: ColorConstants.white,
              boxShadow: [getDeepBoxShadow()],
            ),
          )),
    );
  }
}
