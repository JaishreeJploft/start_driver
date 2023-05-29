import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/early_leave_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';
import 'package:stardriver/time_picker_dialog.dart';

class LeavePermissionView extends GetView<EarlyLeaveController>{
  const LeavePermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Leave Permission',
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: getBorderRadius(),
                    // boxShadow: [getBoxShadow()],
                    border: Border.all(color: ColorConstants.borderColor),
                    color: ColorConstants.primaryColorLight),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: buildSchoolDropDown(),
              ),
              SizedBox(
                height: 2.h,
              ),

              SizedBox(
                height: 1.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText('Date :', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            SvgPicture.asset(
                              'assets/images/fab_calendar.svg',
                              height: getHeadingTextFontSIze(),
                              color: ColorConstants.black,
                            )
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 8,
                        child: GestureDetector(
                          onTap: () => showPicker(context),
                          child: Container(
                            width: 100.w,
                            decoration: getEditTextDecoration(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: addText('dd/mm/yyyy', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.normal),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText('Out\nTime :', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            SvgPicture.asset(
                              'assets/images/ic_time.svg',
                              height: getHeadingTextFontSIze(),
                              color: ColorConstants.black,
                            )
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 8,
                        child: GestureDetector(
                          onTap: () => openTimePicker(),
                          child: Container(
                            width: 100.w,
                            decoration: getEditTextDecoration(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: addText('10:50 AM', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.normal),
                          ),
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: 1.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText('In\nTime :', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            SvgPicture.asset(
                              'assets/images/ic_time.svg',
                              height: getHeadingTextFontSIze(),
                              color: ColorConstants.black,
                            )
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 8,
                        child: GestureDetector(
                          onTap: () => openTimePicker(),
                          child: Container(
                            width: 100.w,
                            decoration: getEditTextDecoration(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: addText('10:30 AM', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.normal),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText('Reason :', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 8,
                        child: Container(
                          width: 100.w,
                          decoration: getEditTextDecoration(),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: addEditText2(
                              controller.leaveReasonController!,
                              'Type here.....',),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Upload file or Photo', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    SvgPicture.asset('assets/images/ic_upload.svg')
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(const SuccessDialog(message: 'Request Submitted'));
                },
                child: BorderedButton(width: 50.w, text: 'SUBMIT'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: controller.schoolItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: controller.selectedSchool.value,
          onChanged: (value) {
            controller.selectedSchool.value = value.toString();
          },
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze() * 1.5,
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          // buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          // dropdownWidth: 78.w,
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

}