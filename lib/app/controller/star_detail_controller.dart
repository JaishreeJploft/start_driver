import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarDetailController extends GetxController with GetSingleTickerProviderStateMixin{

  final selectedTabPosition = 0.obs;
  var tabListItems = ["Main Location", "Emergency Location"];
  late TabController tabController;



  StarDetailController(){
    tabController = TabController(length: 2, vsync: this);
  }


}