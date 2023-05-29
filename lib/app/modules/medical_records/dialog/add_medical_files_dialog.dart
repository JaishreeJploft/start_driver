import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/medical_record_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AddMedicalFilesDialog extends GetView<MedicalRecordController> {
  const AddMedicalFilesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          constraints: BoxConstraints(maxHeight: 80.h),
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
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    color: ColorConstants.borderColor,
                  ),
                ),
              ),
              addText('Add Medical Records', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: addSmallEditText(
                    controller.medicalFileTitleController!, 'Title'),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: buildLineEditText(
                    controller.medicalFileDescriptionController!,
                    'Description'),
              ),
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(
                onTap: (){
                  showPicker(context);
                },
                child: Container(
                  width: 100.w,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: getEditTextDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('dd/mm/yyyy', getNormalTextFontSIze(),
                          ColorConstants.gretTextColor, FontWeight.normal),
                      SvgPicture.asset(
                        'assets/images/fab_calendar.svg',
                        color: ColorConstants.black,
                        height: getHeadingTextFontSIze(),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 100.w,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: getEditTextDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Upload file', getNormalTextFontSIze(),
                        ColorConstants.gretTextColor, FontWeight.normal),
                    SvgPicture.asset('assets/images/ic_upload.svg',
                        height: getHeadingTextFontSIze())
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
