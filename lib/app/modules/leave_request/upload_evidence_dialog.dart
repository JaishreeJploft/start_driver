import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/leave_request_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class UploadEvidenceDialog extends GetView<LeaveRequestController>{
  const UploadEvidenceDialog({super.key});

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
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                  addText('Upload Evidence', getSubheadingTextFontSIze(),
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
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               decoration: getEditTextDecoration(),
               child: addSmallEditText(controller.evidenceReasonController!, 'Reason'),
             ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    addText('From Date', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                    GestureDetector(
                        onTap: () => showPicker(context),
                        child: SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,)),

                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    addText('To Date', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                    GestureDetector(
                        onTap: () => showPicker(context),
                        child: SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,)),

                  ],
                ),
              ),

              SizedBox(
                height: 1.h,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    addText('Upload File', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
                    SvgPicture.asset('assets/images/ic_upload.svg',height: getHeadingTextFontSIze(),color: ColorConstants.black,),

                  ],
                ),
              ),

              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {},
                child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}