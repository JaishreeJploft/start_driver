import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/ModelUserDetails.dart';
import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../storage/base_overlays.dart';

class MyProfileController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController controller;
  TextEditingController? addFamilyNameController;
  TextEditingController? addFamilyMobileController;
  TextEditingController? deleteFamilyReasonController;

  Rx<ModelGetUserDetails> userDetailsResponse = ModelGetUserDetails().obs;

  @override
  onInit() {
    super.onInit();
    GetUserDetails();
  }

  final addFamilyDOB = 'dd/mm/yyyy'.obs;
  final addFamilyIDExpiryDate = 'dd/mm/yyyy'.obs;
  final addFamilyUploadId = 'Upload ID'.obs;
  final addFamilyRelation = 'Mother'.obs;
  final List<String> relationItems = [
    'Mother',
    'Father',
    'Brother',
    'Sister',
    'Others'
  ];

  final addFamilyMemberHeader = 'Add Family Member'.obs;

  MyProfileController(){
    controller = TabController(vsync: this, length: 3);
    addFamilyNameController = TextEditingController();
    addFamilyMobileController = TextEditingController();
    deleteFamilyReasonController = TextEditingController();
  }

  GetUserDetails(){
    print("value inside the login method");
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    print('checking data');
    BaseAPI().get(url: (ApiEndPoints().getUserDetails)).then((value){
      if (value?.statusCode == 200) {
        userDetailsResponse.value = ModelGetUserDetails.fromJson(value?.data);
        if ((userDetailsResponse.value.message??"").isNotEmpty) {
          //BaseOverlays().showSnackBar(message: userDetailsResponse.value.message??"",title: "Success");
        }
      }
    });
  }
}