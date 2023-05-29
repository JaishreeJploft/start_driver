import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController with GetTickerProviderStateMixin {
  final selectedTabPosition = 0.obs;
  var tabListItems = ["Purchase", "Event"];
  late TabController tabController;

  final headingText = 'Wallet'.obs;

  WalletController() {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onInit() {
    super.onInit();
    headingText.value = Get.arguments['heading'] as String;
  }
}
