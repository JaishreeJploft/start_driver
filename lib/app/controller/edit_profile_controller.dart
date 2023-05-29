import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stardriver/backend/sp_keys.dart';
import '../../Model/ModelUpdateProfile.dart';
import '../../Model/ModelUserDetails.dart';
import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../storage/base_overlays.dart';
import 'package:dio/dio.dart' as dio;
import '../../storage/base_shared_preference.dart';
import '../modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';

class EditProfileController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? alternateMobileController;
  TextEditingController? dobController;
  TextEditingController? emailController;
  TextEditingController? addressController;
  TextEditingController? stateController;
  TextEditingController? nationalityController;
  TextEditingController? emiratesIDController;
  TextEditingController? idExpiryController;

  final formKey = GlobalKey<FormState>();
  String? imageFile;
  String? documentFile;
  String? imageLocation;
  String? documentLocation;
  Rx<String> image = ''.obs;
  Rx<String> document = ''.obs;
  Rx<ModelUpdateProfile> response = ModelUpdateProfile().obs;
  Rx<ModelGetUserDetails> userDetailsResponse = ModelGetUserDetails().obs;

  @override
   onInit() {
    super.onInit();
    GetUserDetails();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    alternateMobileController = TextEditingController();
    dobController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    stateController = TextEditingController();
    nationalityController = TextEditingController();
    emiratesIDController = TextEditingController();
    idExpiryController = TextEditingController();
    print(BaseSharedPreference().getString(SpKeys().userId));
  }

  GetUserDetails(){
    print("value inside the login method");
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
      print('checking data');
      BaseAPI().get(url: (ApiEndPoints().getUserDetails)).then((value){
        if (value?.statusCode == 200) {
          userDetailsResponse.value = ModelGetUserDetails.fromJson(value?.data);
          if ((userDetailsResponse.value.message??"").isNotEmpty) {
            nameController?.text = userDetailsResponse.value.data?.name ?? "";
            mobileController?.text = userDetailsResponse.value.data?.mobile ?? "";
            alternateMobileController?.text = userDetailsResponse.value.data?.alternativeMobile.toString() ?? "";
            dobController?.text = userDetailsResponse.value.data?.dob ?? "";
            emailController?.text = userDetailsResponse.value.data?.email.toString() ?? "";
            nationalityController?.text = userDetailsResponse.value.data?.nationality ?? "";
            emiratesIDController?.text = userDetailsResponse.value.data?.emirateId ?? "";
            idExpiryController?.text = userDetailsResponse.value.data?.emirateIdExpire ?? "";
            addressController?.text = userDetailsResponse.value.data?.address ?? "";
            stateController?.text = userDetailsResponse.value.data?.state.toString() ?? "";
            //image.value = ApiEndPoints().imageBaseUrl+userDetailsResponse.value.data?.profilePic ?? "";
            // document.value = userDetailsResponse.value.data?.idDocument ?? "";
            //BaseOverlays().showSnackBar(message: userDetailsResponse.value.message??"",title: "Success");
          }
        }
      });
  }

  EditProfile() async {
    DateTime dateTime = DateFormat('dd MMMM, yyyy').parse(dobController?.text.toString()?? "");
    String outputDate = DateFormat('yyyy-MM-dd').format(dateTime);
    //ExpireDate
    DateTime expireDate = DateFormat('dd MMM, yyyy').parse(idExpiryController?.text.toString()?? "");
    String expireDateOutput = DateFormat('yyyy-MM-dd').format(expireDate);

    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (formKey.currentState?.validate() ?? false) {
      Map<String, dynamic> data = {
        "name" : nameController?.text.trim(),
        "mobile" : mobileController?.text.trim(),
        "dob" : outputDate.toString(),
        "alternativeMobile" : alternateMobileController?.text.trim(),
        "email" : emailController?.text.trim().toString() == null ?? "",
        "nationality" : "6450a9e2e2719e102c7459cd",
        "emirateId" : emiratesIDController?.text.trim(),
        "emirateIdExpire" : expireDateOutput.toString(),
        "nativeLanguage" : "6450a9e2e2719e102c7459cd",
        "religion" : "6450a9e2e2719e102c7459cd",
        "role" : "64467c68f871809066b4e219",
        "school": "6450a9e2e2719e102c7459cd",
        "address" : addressController?.text.trim(),
        "state" : stateController?.text.trim(),
      };
      // if (image.value.isNotEmpty) {
      //   print(image.value);
      //   data["profilePic"] = await dio.MultipartFile.fromFile(image.value, filename: document.value.split('/').last);
      //   print(image.value);
      // }
      // if (document.value.isNotEmpty) {
      //   data["document"] = await dio.MultipartFile.fromFile(document.value, filename: image.value.split('/').last);
      //   print(document.value);
      // }
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      BaseAPI().postFormData((ApiEndPoints().getUpdatedUserProfile+"/$userId"),data,"patch").then((value){
        if (value?.statusCode == 200) {
          response.value = ModelUpdateProfile.fromJson(value?.data);
          if ((response.value.data?.message??"").isNotEmpty) {
            // Get.back();
            BaseOverlays().showSnackBar(message: response.value.data?.message??"",title: "Success");
            Get.dialog(const SuccessDialog(
              message: 'Profile Completed.',
            ));
          }
        }
      });
    }
  }
}
