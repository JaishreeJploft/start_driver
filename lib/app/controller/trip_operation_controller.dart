import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripOperationController extends GetxController with GetSingleTickerProviderStateMixin{

  var tabListItems = ["Remaining", "Onboard", "Late", "Absent"];
  final selectedTabPosition = 0.obs;
  late TabController controller;

  final selectedPos = 0.obs;
  var optionsImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];

  final calendarSelectedPos = 1.obs;

  TripOperationController(){
    controller = TabController(vsync: this, length: 4);
  }

}