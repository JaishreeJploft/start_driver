import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnualController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];
  late TabController controller;

  final List<String> dates = ['July 2', 'July 3', 'July 4'];
  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved'
  ];
  int curStep = 2; // 2 is kept minimum
  var feedbackList = [
    'ACCEPT',
    'COMMENT',
  ];
  final selectedFeedbackPos = 1.obs;
  TextEditingController? commentController;

  AnnualController() {
    controller = TabController(vsync: this, length: 3);
    commentController = TextEditingController();
  }
}
