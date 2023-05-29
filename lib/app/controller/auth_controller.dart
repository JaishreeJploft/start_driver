import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardriver/app/controller/language_select_controller.dart';
import 'package:stardriver/backend/base_api.dart';

import '../../Model/ModelLogin.dart';
import '../../Model/ModelLoginWithOtp.dart';
import '../../backend/api_end_points.dart';
import '../../backend/sp_keys.dart';
import '../../storage/base_overlays.dart';
import '../../storage/base_shared_preference.dart';
import '../modules/auth/verification_view.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  TextEditingController? loginTextController;
  TextEditingController? fullNameController;
  TextEditingController? mobileController;
  TextEditingController? otpController;
  TextEditingController? employeeIdController;

  final formKey = GlobalKey<FormState>();
  final myFromKey = GlobalKey<FormState>();
  TextEditingController mobileCtrl = TextEditingController();
  ModelLoginWithOtp response = ModelLoginWithOtp();
  ModelLogin loginResponse = ModelLogin();

  final enteredOtp = ''.obs;
  String? selectedLanguageCode;

  var roleImagesList = [
    'assets/images/ic_teacher.svg',
    'assets/images/ic_admin.svg',
    'assets/images/ic_driver.svg',
    'assets/images/ic_school_security.svg',
    'assets/images/ic_shop.svg',
    'assets/images/ic_nurse.svg',
  ];

  var roleNameList = [
    'Teacher',
    'Admin',
    'Driver/Supervisor',
    'School Security',
    'Shop',
    'Nurse'
  ];
  final selectedPos = 2.obs;

  var roleTypeNameList = ['Driver', 'Supervisor'];
  final selectedTypePos = 0.obs;
  var typeImagesList = [
    'assets/images/ic_driver.svg',
    'assets/images/ic_supervisor.svg',
  ];

  AuthController() {
    loginTextController = TextEditingController();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
    otpController = TextEditingController();
    employeeIdController = TextEditingController();
  }

  loginApi(){
    print("value inside the login method");
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()??false) {
      print('checking data');
      Map<String, dynamic> data = {
        "mobile": loginTextController?.text,
        "role" : "staff"
      };
      BaseAPI().post(url: ApiEndPoints().getLoginWithOtp, data: data).then((value){
        print("inside BaseAPI");
        if (value?.statusCode == 200) {
          response = ModelLoginWithOtp.fromJson(value?.data);
          print(response);
          print("value of data");
          if ((response.data?.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.data!.message??"",title: response.message??"");
            print(response.message);
          }
          // Get.toNamed(Routes.verificationView, arguments: );
          Get.to(VerificationView(mobile: loginTextController!.text.toString()));

        }
      });
    }
  }

  // VerifyUser(){
  //   print("value inside the login method");
  //   FocusScope.of(Get.context!).requestFocus(new FocusNode());
  //   if (myFromKey.currentState?.validate()??false) {
  //     print('checking data');
  //     var data = {
  //       "mobile": mobileCtrl.text,
  //       "role" : "staff",
  //       "otp" : otpController?.text ?? "1234",
  //       "deviceToken" : "deviceToken",
  //       "deviceType" : "ios",
  //       "deviceVoip" : "fdsfad"
  //     };
  //     BaseAPI().post(url: ApiEndPoints().getLoginDetails, data: data).then((value){
  //       print("inside BaseAPI");
  //       if (value?.statusCode == 200) {
  //         loginResponse = ModelLogin.fromJson(value?.data);
  //         print(loginResponse);
  //         print("value of data");
  //         if ((loginResponse.data?.message??"").isNotEmpty) {
  //           BaseOverlays().showSnackBar(message: loginResponse.message??"",title: loginResponse.message??"");
  //           print(loginResponse.message);
  //         }
  //         Get.toNamed(Routes.selectUserType);
  //       }
  //     });
  //   }
  // }

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedLanguageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
  }

  otpApi({required String mobile}){
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (myFromKey.currentState?.validate()??false) {
      Map<String, dynamic> data = {
        "userInput": loginTextController!.text,
        "otp": otpController!.text,
        "role" : "staff",
        "deviceToken" : "deviceToken",
        "deviceType" : Platform.isAndroid ? "android" : "ios",
        "deviceVoip" : "fdsfad"
      };
      BaseAPI().post(url: ApiEndPoints().otp,data: data, headers: {'Accept-Language': selectedLanguageCode??"en",}).then((value){
        loginResponse = ModelLogin.fromJson(value?.data);
        if (loginResponse.statusCode == 200) {
          // otpController.clear();
          // otpController.text = "";
          BaseSharedPreference().setBool(SpKeys().isLoggedIn, true);
          BaseSharedPreference().setString(SpKeys().apiToken, loginResponse.data?.token??"");
          BaseSharedPreference().setString(SpKeys().userId, loginResponse.data?.user?.sId??"");
          print(loginResponse.data?.user?.sId);
          print(SpKeys().userId);
          if ((loginResponse.data?.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: loginResponse.data?.message??"",title: loginResponse.message??"");
          }
          Get.toNamed(Routes.baseView);
        } else {
          if ((loginResponse.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: loginResponse.message??"",title: "Error");
          }
        }
      });
    }
  }

}
