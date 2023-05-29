import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/preferences.dart';

class LanguageSelectController extends GetxController{

  final languageList = ['Arabic','English'].obs;
  var languageCodeList = ['ar','en_US'];
  var languageImageList = ['assets/images/ic_arabic.svg','assets/images/ic_english.svg'];
  final selectedPos = 1.obs;
  late GetStorage _box;

  LanguageSelectController(){
    _box = Get.find<GetStorage>();
  }

  void updateLocale(value) async {
    try{
      if (value.contains('_')) {
        // en_US

        Get.updateLocale(Locale(value.split('_').elementAt(0), value.split('_').elementAt(1)));
      } else {
        // ar
        Get.updateLocale(Locale(value));
      }
    } catch(e){
      Get.log('=================== Exception is $e');
    }

    await _box.write(SharedPref.isLanguageSelected, 'true');
    await _box.write('language', value);
    Get.toNamed(Routes.selectUserType);
  }


}