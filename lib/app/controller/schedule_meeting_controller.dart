import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleMeetingController extends GetxController with GetSingleTickerProviderStateMixin{

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];
  late TabController controller;


  final List<String> dates = ['July 2', 'July 3', 'July 4','July 5'];
  final List<String> heading = [
    'Request\nRaised',
    'Accepted',
    'Planned On',
    'Completed'
  ];
  int curStep = 3; // 2 is kept minimum

  var pendingList = ['RESCHEDULE', 'CANCEL', 'ACCEPT'];
  final selectedPendingPos = 2.obs;

  var planningList = ['RESCHEDULE', 'CANCEL'];
  final selectedPlanningPos = 0.obs;

  TextEditingController? cancelMeetingReasonController;

  final rescheduleDate = DateTime.now().obs;
  final selectedRescheduleDatePos = 0.obs;
  var rescheduleDateTimeList = [
    '9:00 am',
    '9:30 am',
    '10:00 am',
    '10:30 am',
  ];

  final showFeedback = false.obs;

  ScheduleMeetingController(){
    controller = TabController(length: 4, vsync: this);
    cancelMeetingReasonController = TextEditingController();
  }

  void setRescheduleDate(DateTime date) {
    rescheduleDate.value = date;
  }

}