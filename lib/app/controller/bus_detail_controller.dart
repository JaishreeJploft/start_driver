import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusDetailController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController controller;
  final selectedPos = 1 .obs;
  TextEditingController? currentKmController;
  TextEditingController? addRecordTitleController;
  TextEditingController? addRecordKmController;
  final addRecordDate = 'dd/mm/yyyy'.obs;

  BusDetailController(){
    controller = TabController(length: 2, vsync: this);
    currentKmController = TextEditingController();
    addRecordTitleController = TextEditingController();
    addRecordKmController = TextEditingController();
  }

}