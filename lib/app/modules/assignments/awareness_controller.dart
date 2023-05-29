import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwarenessController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final tabControllerPos = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
