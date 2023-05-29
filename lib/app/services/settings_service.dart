import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/utils.dart';
import 'translation_service.dart';

class SettingsService extends GetxService {

  late GetStorage _box;

  SettingsService() {
    _box =  GetStorage();
  }

  Future<SettingsService> init() async {
    return this;
  }


  Locale getLocale() {
    String? locale = GetStorage().read<String>('language');
    if (locale == null || locale.isEmpty) {
      locale = 'en_US';
      storeValue('language', 'en_US');
    }
    return Get.find<TranslationService>().fromStringToLocale(locale);
  }

}
