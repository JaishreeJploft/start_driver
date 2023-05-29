import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/create_meeting_controller.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/app/modules/schedule_meeting/dialogs/reschedule_meeting_dialog.dart';
import 'package:stardriver/app/modules/schedule_meeting/dialogs/schedule_with_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class CreateMeeting extends GetView<CreateMeetingController>{
  const CreateMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Schedule Meeting',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            Container(
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor),
                  color: ColorConstants.primaryColorLight),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: buildSchoolDropDown(Get.find<ScheduleMeetingController>().schoolItems,Get.find<ScheduleMeetingController>().selectedSchool,'Hint'),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              decoration: getEditTextDecoration(),
              child: buildDropDown(controller.roleList, controller.selectedRole, 'Select Role'),
            ),
            SizedBox(
              height: 2.h,
            ),

            GestureDetector(
              onTap: (){
                Get.dialog(const ScheduleWithDialog());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: getEditTextDecoration(),
                child: Row(
                  children: [
                    addText('Select schedule with', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down,color: ColorConstants.lightGreyColor,size: 30,)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              decoration: getEditTextDecoration(),
              child: buildDropDown(controller.meetingTypeList, controller.selectedMeetingType, 'Meeting type'),
            ),

            SizedBox(
              height: 2.h,
            ),


            Row(
              children: [
                addText('Date', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                SizedBox(width: 20.w,),
                Expanded(child: GestureDetector(
                  onTap: (){
                    Get.dialog(RescheduleMeetingDialog(title: 'Select Date & Time',));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: getEditTextDecoration(),
                    child: Row(
                      children: [
                        addText('20/10/2023', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                        const Spacer(),
                        GestureDetector(
                            onTap: () => showPicker(context),
                            child: SvgPicture.asset('assets/images/fab_calendar.svg',color: ColorConstants.gretTextColor,height: 25,))
                      ],
                    ),
                  ),
                ))

              ],
            ),

            SizedBox(
              height: 2.h,
            ),

            Row(
              children: [
                addText('Selected Slot', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                SizedBox(width: 5.w,),
                CircularBorderedButton(width: 30.w, text: '09:00 AM')

              ],
            ),

            SizedBox(
              height: 10.h,
            ),


            GestureDetector(onTap: (){},
            child: BorderedButton(width: 50.w, text: 'SUBMIT'),)


          ],
        ),
      ),
    );
  }


  Widget buildSchoolDropDown(List<String> list,RxString selectedValue,String hint) {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: addText(hint, getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
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
          value : selectedValue.value.isNotEmpty
              ? selectedValue.value
              : null,
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


  Widget buildDropDown(List<String> list,RxString selectedValue,String hint) {
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
        value: selectedValue.value.isNotEmpty
            ? selectedValue.value
            : null,
        onChanged: (value) {
          selectedValue.value = value as String;
        },

        iconSize: 30,
        icon: const Icon(Icons.arrow_drop_down,color: ColorConstants.lightGreyColor,),
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