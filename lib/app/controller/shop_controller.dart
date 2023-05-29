import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController with GetTickerProviderStateMixin{

  late TabController tabController;
  final selectedTabPosition = 0.obs;
  var tabListItems = ["Shop", "Orders"];




  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  ShopController(){
    tabController = TabController(length: 2, vsync: this);

  }

}