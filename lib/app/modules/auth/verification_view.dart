import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/auth_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class VerificationView extends GetView<AuthController> {
  final String mobile;
  final bool? isFromActivation;
  const VerificationView({Key? key, required this.mobile, this.isFromActivation = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.myFromKey,
        child: SafeArea(
            child: Column(
            children: [
            Flexible(
                flex: 2,
                child: Center(
                  child: addText('SMS Verification', getLargeTextFontSIze(),
                      ColorConstants.primaryColor, FontWeight.w400),
                )),
            Flexible(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.only(top: 8.h, left: 7.w, right: 7.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: ColorConstants.white,
                      boxShadow: [getDeepBoxShadow()]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: addText("OTP Sent!", getLargeTextFontSIze(),
                              ColorConstants.black, FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          addText(
                              "Please enter the 4-digit OTP sent to ",
                              getNormalTextFontSIze(),
                              ColorConstants.gretTextColor,
                              FontWeight.normal),
                          // addText(
                          //     "05x-xxxxxxxxx",
                          //     getNormalTextFontSIze(),
                          //     ColorConstants.gretTextColor,
                          //     FontWeight.normal)
                        ],
                      ),
                      Row(
                        children: [
                          // addText(
                          //     "Please enter the 4-digit OTP sent to ",
                          //     getNormalTextFontSIze(),
                          //     ColorConstants.gretTextColor,
                          //     FontWeight.normal),
                          addText(mobile, getNormalTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal)
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      PinCodeTextField(
                        textStyle: TextStyle(color: ColorConstants.primaryColor),
                        length: 4, autoFocus: true,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        cursorColor: Colors.black,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 9.h,
                          inactiveColor: ColorConstants.borderColor,
                          fieldWidth: 9.h,
                          borderWidth: 1,
                          disabledColor: ColorConstants.borderColor,
                          activeColor: ColorConstants.primaryColor,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedColor: ColorConstants.borderColor,
                          activeFillColor: ColorConstants.primaryColorLight,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        // backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        controller: controller.otpController,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          // setState(() {
                          //   currentText = value;
                          // });
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        validator: (val) {
                          print(val);
                          if (val!.isEmpty) return "Please enter OTP.";
                          if (val.length < 4) return "Invalid OTP. Please try again.";
                          return null;
                        },
                        appContext: context,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.otpController!.clear();
                          controller.loginApi();
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Didn't receive OTP? ".tr,
                                  style: TextStyle(
                                    fontFamily: 'Ariel',
                                    fontSize: getSubheadingTextFontSIze(),
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                              TextSpan(
                                text: "Send again.".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getSubheadingTextFontSIze(),
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.otpApi(mobile: mobile.toString());
                        },
                        child: BorderedButton(width: 50.w, text: 'SUBMIT'),
                      )
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
