import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EarlyLeaveController extends GetxController{

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  TextEditingController? leaveReasonController;

  EarlyLeaveController(){
    leaveReasonController = TextEditingController();
  }

}