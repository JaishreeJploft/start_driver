import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/auth_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import '../../../common/my_textform_field.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstants.primaryColorLight,
        body: SafeArea(
            child: Column(
            children: [
            Flexible(
                flex: 2,
                child: Center(
                  child: addText('Login', getLargeTextFontSIze(),
                      ColorConstants.primaryColor, FontWeight.w400),
                )),
            Flexible(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.only(top: 6 .h, left: 7.w, right: 7.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: ColorConstants.white,
                      boxShadow: [getDeepBoxShadow()]),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: addText("Welcome", getLargeTextFontSIze(),
                              ColorConstants.black, FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: addText(
                              "Please login to your account",
                              getNormalTextFontSIze(),
                              ColorConstants.gretTextColor,
                              FontWeight.normal)),
                      SizedBox(
                        height: 8.h,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   decoration: getEditTextDecoration(),
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.phone,
                      //         color: ColorConstants.primaryColor,
                      //         size: getLargeTextFontSIze() * 1.2,
                      //       ),
                      //       const SizedBox(
                      //         width: 20,
                      //       ),
                      //       MyTextFormField(
                      //         controller: controller.loginTextController!,
                      //         hintText: "05x-xxxxxxxxx",
                      //         isPhone: true, titleText: '',
                      //       ),
                      //      // addEditText(controller.loginTextController!, '05x-xxxxxxxxx'),
                      //     ],
                      //   ),
                      // ),
                      MyTextFormField(
                        controller: controller.loginTextController!,
                        isPhone: true,
                        errorMsg: "Please enter a valid phone no. between 7 to 15 digits.",
                        preffix: Padding(
                            padding: EdgeInsetsDirectional.only(start: 3.w,end: 2.w),
                            child: Icon(
                              Icons.phone,
                              color: ColorConstants.primaryColor,
                              size: getLargeTextFontSIze() * 1.2,
                            ),),
                        hintText: "05x-xxxxxxxxx",textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.loginApi();
                          print("Send otp clicked");
                        },
                        child: BorderedButton(width: 50.w, text: 'SEND OTP'),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      addText('OR', getHeadingTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_face_scan.svg',
                            height: 9.h,
                            width: 9.h,
                          ),
                          // SvgPicture.asset(
                          //   'assets/images/ic_thumb.svg',
                          //   height: 10.h,
                          // )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.accountActivationView),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Don’t have a account? ".tr,
                                  style: TextStyle(
                                    fontFamily: 'Ariel',
                                    fontSize: getNormalTextFontSIze(),
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.normal,
                                  )),
                              TextSpan(
                                text: "Activate Account".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getNormalTextFontSIze(),
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
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
