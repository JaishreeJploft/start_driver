import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../Model/ModelLoginWithOtp.dart';
import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../storage/base_overlays.dart';

class LoginCtrl extends GetxController{

  final formKey = GlobalKey<FormState>();
  TextEditingController mobileCtrl = TextEditingController();
  ModelLoginWithOtp response = ModelLoginWithOtp();

  loginApi({bool? isResend}){
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()??false) {
      Map<String, dynamic> data = {
        "mobile": mobileCtrl.text.trim(),
        "role" : "staff"
      };
      BaseAPI().post(url: ApiEndPoints().getLoginWithOtp,data: data).then((value){
        if (value?.statusCode == 200) {
          //response = LoginResponse.fromJson(value?.data);
          if ((response.message?.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.data?.message??"",title: response.message??"");
          }
          //Get.to(OTPScreen(mobile: mobileCtrl.text.trim()));
        }
      });
    }
  }

}