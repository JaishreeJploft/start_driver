import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  TextEditingController? eventRejectController;

  final currentTab = 'Upcoming'.obs;

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  void changeTab(String tab) {
    currentTab.value = tab;
  }

  EventsController() {
    eventRejectController = TextEditingController();
  }
}
