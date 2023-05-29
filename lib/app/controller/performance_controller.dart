import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformanceController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController controller;
  final managementFilterSelectedPos = 10.obs;
  final staffFilterSelectedPos = 10.obs;
  final starsFilterSelectedPos = 10.obs;
  final parentsFilterSelectedPos = 10.obs;



  PerformanceController(){
    controller = TabController(vsync: this, length: 4);

  }
}