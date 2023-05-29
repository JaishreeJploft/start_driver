import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController with GetTickerProviderStateMixin {
  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];
  late TabController controller;
  final selectedTabPos = 0.obs;

  late TabController staffTabController;
  final selectedTabPosition = 0.obs;
  var tabListItems = ["Individual", "Group Name"];

  ChatController() {
    controller = TabController(length: 3, vsync: this);
    staffTabController = TabController(length: 2, vsync: this);
  }
}
