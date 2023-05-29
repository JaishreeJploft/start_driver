import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/edit_profile_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';
import '../../../../../../Showpicker_dialog.dart';
import '../../../../../../custom_dialog.dart';
import '../../../../../routes/app_routes.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({super.key});
  File? _profileImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: getLargeTextFontSIze() * 1.2,
                      ),
                    ),
                    SvgPicture.asset('assets/images/notification.svg')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    border: Border.all(color: ColorConstants.primaryColor),
                    borderRadius: getCurvedBorderRadius()),
                child: SvgPicture.asset('assets/images/ic_driver.svg', color: ColorConstants.primaryColor,),
                //child:
                // _profileImage==null?
                // controller.image.value == "" ?
                // SvgPicture.asset('assets/images/ic_driver.svg', color: ColorConstants.primaryColor,):
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15),
                //   child: SizedBox(
                //       height: 10.h,
                //       width: 16.w,
                //       child: Image.network(controller.image.value),
                // )):
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15),
                //   child: SizedBox(
                //       height: 10.h,
                //       width: 16.w,
                //       child: Image.file(File(controller.image.value))),
                // ) ,

              ),
              // Obx(
              //   () => GestureDetector(
              //     onTap: ()async {
              //       _profileImage =await showMediaPickerDialog(context);
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //           color: ColorConstants.white,
              //           border: Border.all(color: ColorConstants.primaryColor),
              //           borderRadius: getCurvedBorderRadius()),
              //       child: SvgPicture.asset('assets/images/ic_driver.svg', color: ColorConstants.primaryColor,),
              //       //child:
              //       // _profileImage==null?
              //       // controller.image.value == "" ?
              //       // SvgPicture.asset('assets/images/ic_driver.svg', color: ColorConstants.primaryColor,):
              //       // ClipRRect(
              //       //   borderRadius: BorderRadius.circular(15),
              //       //   child: SizedBox(
              //       //       height: 10.h,
              //       //       width: 16.w,
              //       //       child: Image.network(controller.image.value),
              //       // )):
              //       // ClipRRect(
              //       //   borderRadius: BorderRadius.circular(15),
              //       //   child: SizedBox(
              //       //       height: 10.h,
              //       //       width: 16.w,
              //       //       child: Image.file(File(controller.image.value))),
              //       // ) ,
              //
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //     onTap: () {
              //       showMediaPickerDialog((fileName, filePath) {
              //         controller.image.value = filePath!.path;
              //         print(controller.image.value.toString());
              //         print('image location');
              //       });
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //           color: ColorConstants.white,
              //           border: Border.all(color: ColorConstants.primaryColor),
              //           borderRadius: getCurvedBorderRadius()),
              //       //child: SvgPicture.asset('assets/images/ic_driver.svg', color: ColorConstants.primaryColor,),
              //       child: controller.image.value != "" ?
              //       SizedBox(
              //           height: 10.h,
              //           width: 16.w,
              //           child: Image.file(File(controller.image.value))) : SvgPicture.asset('assets/images/ic_driver.svg', color: ColorConstants.primaryColor,),
              //
              //     ),
              //   ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                  child: Container(
                width: 100.w,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    boxShadow: [getDeepBoxShadow()],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      buildEditText('Name', controller.nameController),
                      buildEditText('Mobile No', controller.mobileController,
                        suffix: GestureDetector(
                          onTap: () {
                            showCustomDialog(Get.context!, title: '', children: [
                              SvgPicture.asset(
                                'assets/images/active_checkbox_shadow.svg',
                                height: 60,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                'Request to change registered number was sent successfully. You will receive an SMS notification of approval.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ]);
                          },
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: ColorConstants.primaryColorLight,
                                boxShadow: [getDeepBoxShadow()],
                                border: Border.all(
                                    color: ColorConstants.primaryColor,
                                    width: 1.5),
                                borderRadius: getBorderRadiusCircular()),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
                              child: Center(
                                child: addText('change', getSmallTextFontSIze(),
                                    ColorConstants.primaryColor, FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildEditText('Alternate Mobile No', controller.alternateMobileController, suffix: GestureDetector(
                        onTap: () {
                          showCustomDialog(Get.context!, title: '', children: [
                            SvgPicture.asset(
                              'assets/images/active_checkbox_shadow.svg',
                              height: 60,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Request to change registered number was sent successfully. You will receive an SMS notification of approval.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ]);
                        },
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: ColorConstants.primaryColorLight,
                              boxShadow: [getDeepBoxShadow()],
                              border: Border.all(
                                  color: ColorConstants.primaryColor,
                                  width: 1.5),
                              borderRadius: getBorderRadiusCircular()),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
                            child: Center(
                              child: addText('change', getSmallTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                      buildEditText('DOB', controller.dobController),
                      buildEditText('Email', controller.emailController),
                      buildEditText('Address', controller.addressController, suffixIcon: true, onTap: () {Get.toNamed(Routes.tripRouteView);}),
                      buildEditText('State', controller.stateController),
                      buildEditText('Nationality', controller.nationalityController),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('Emirates ID', getNormalTextFontSIze(),
                                  ColorConstants.black, FontWeight.normal),
                              SizedBox(
                                  width: 40.w,
                                  child: addPrimaryColorEditText(
                                      controller.emiratesIDController!, '')),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('Expiry Date', getNormalTextFontSIze(),
                                  ColorConstants.black, FontWeight.normal),
                              Row(
                                children: [
                                  SizedBox(
                                      width: 40.w,
                                      child: addPrimaryColorEditText(
                                          controller.idExpiryController!, '')),
                                  GestureDetector(
                                      onTap: () {
                                        showPicker(context);
                                      },
                                      child: SvgPicture.asset(
                                          'assets/images/ic_calendar.svg'))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: ColorConstants.borderColor2,
                        height: 0,
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('Upload Document', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.normal),
                          GestureDetector(
                            onTap: () {
                              // print("image picker method");
                              // showMediaPickerDialog((fileName, filePath) {
                              //   controller.document.value = filePath!.path;
                              //   print(controller.document.value);
                              //   print("path");
                              // });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset('assets/images/ic_upload.svg', color: ColorConstants.primaryColor,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      controller.document.value == "" ?
                      SizedBox() :
                      Obx(
                          ()=> Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: ColorConstants.white,
                              border: Border.all(color: ColorConstants.primaryColor),
                              borderRadius: getCurvedBorderRadius()),
                          child: SizedBox(
                              height: 20.h,
                              width: 100.w,
                              child: controller.document.value == null ? Image.file(File(controller.document.value ) )  :  Image.network(controller.document.value)
                          ) ,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: ColorConstants.borderColor2,
                        // height: 10,
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                             controller.EditProfile();
                             Get.focusScope!.unfocus();
                             Get.back();
                          },
                          child: BorderedButton(width: 50.w, text: 'SAVE'),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditText(String heading, TextEditingController? controller,
      {bool suffixIcon = false,
      void Function()? onTap,
      Widget suffix = const SizedBox()}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addText(heading, getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
        addPrimaryColorEditText(controller!, '', suffixIcon: suffixIcon, onTap: onTap, suffix: suffix),
        const Divider(
          color: ColorConstants.borderColor2,
          height: 0,
          thickness: 1.5,
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
