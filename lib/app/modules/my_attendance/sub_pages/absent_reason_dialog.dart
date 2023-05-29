import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/attendance_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AbsentReasonDialog extends GetView<AttendanceController> {
  const AbsentReasonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('March 01, 2022', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: addText('Reason :  ', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: getEditTextDecoration(),
                        alignment: Alignment.centerLeft,
                        child: buildLineEditText(
                            controller.reasonController!, 'Type Here.....',
                            maxlines: 1, color: ColorConstants.black),
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: addText(
                        'Upload Evidence : ',
                        getNormalTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.bold),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                      width: double.infinity,
                      decoration: getEditTextDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addAlignedText(
                              'Upload Document',
                              getNormalTextFontSIze(),
                              ColorConstants.black,
                              FontWeight.normal),
                          SvgPicture.asset("assets/images/ic_upload.svg")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: addText(
                    'Photo Uploaded 132KB',
                    getSmallTextFontSIze() - 1,
                    ColorConstants.blue,
                    FontWeight.normal),
              ),
              SizedBox(
                height: 2.h,
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
