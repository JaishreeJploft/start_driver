import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/auth_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AccountActivationView extends GetView<AuthController>{
  const AccountActivationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 5,
                        child: GestureDetector(
                          onTap: (){
                            Get.back();
                          },child: const Icon(Icons.arrow_back_ios_new,color: ColorConstants.black,),
                        ),
                      ),
                      Center(
                        child: addText('Account Activation', getLargeTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w400),
                      )
                    ],
                  )),
              Flexible(
                  flex: 12,
                  child: Container(
                    padding: EdgeInsets.only(top: 4.h, left: 7.w, right: 7.w),
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: ColorConstants.white,
                        boxShadow: [getDeepBoxShadow()]),
                    child: Column(
                      children: [
                        buildInputField('Full Name', controller.fullNameController!),
                        SizedBox(height: 2.h,),
                        buildNumberInputField('Mobile\nNumber', controller.mobileController!),
                        SizedBox(height: 1.h,),
                        buildInputField('OTP for\nverification:', controller.otpController!),
                        SizedBox(height: 2.h,),
                        buildInputField('Employee Id', controller.employeeIdController!),
                        SizedBox(height: 4.h,),
                        GestureDetector(
                          onTap: (){
                            // showActivationDialogue(context);
                            _showActivationDialogue(context);
                          },
                          child: BorderedButton(width: 50.w, text: 'SUBMIT'),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }

  void _showActivationDialogue(BuildContext context) {
    showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        addAlignedText('Your activation request has been sent successfully, after revision,you will be informed about your activation status via SMS & Email.',
                            getSubheadingTextFontSIze(),
                            ColorConstants.black, FontWeight.w700),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.rulesView);
                          },
                          child: BorderedButton(width: 40.w, text: 'Ok'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  
  
  Widget buildInputField(String fieldName,TextEditingController controller){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(fieldName, getNormalSmallTextFontSIze(), ColorConstants.black, FontWeight.w700),

        Container(
          width: 60.w,
          decoration: getEditTextDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: ColorConstants.primaryColor,
            keyboardType: TextInputType.text,
            controller: controller,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: getNormalSmallTextFontSIze()),
            decoration: InputDecoration(
                hintText: 'Type here.....'.tr,
                hintStyle: TextStyle(
                    fontSize: getNormalSmallTextFontSIze(),
                    color: ColorConstants.gretTextColor),
                border: InputBorder.none),
          ),
        )

        // Flexible(
        //   flex: 7,
        //   child: addDecoratedEditText(controller, 'Type here.....'),
        // )

      ],
    );
  }


  Widget buildNumberInputField(String fieldName,TextEditingController controller){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            addText(fieldName, getNormalSmallTextFontSIze(), ColorConstants.black, FontWeight.w700),
            Container(
              width: 60.w,
              decoration: getEditTextDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  TextFormField(
                    cursorColor: ColorConstants.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: getNormalSmallTextFontSIze()),
                    decoration: InputDecoration(
                        hintText: 'Type here.....'.tr,
                        hintStyle: TextStyle(
                            fontSize: getNormalSmallTextFontSIze(),
                            color: ColorConstants.gretTextColor),
                        border: InputBorder.none),
                  ),
                  Positioned(
                     top: 0,
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: (){},
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: getEdgyBorderRadius(),
                              color: ColorConstants.gretTextColor,
                            ),child: addText('SEND OTP', getSmallestTextFontSIze(), ColorConstants.white, FontWeight.w700),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            addText('OTP sent.', getNormalTextFontSIze()-2, Colors.green, FontWeight.w500),
            const SizedBox(width: 5,),
            addUnderlineLineText('Resend', getNormalTextFontSIze()-2, Colors.red, FontWeight.w500)


          ],
        )
      ],
    );
  }

}