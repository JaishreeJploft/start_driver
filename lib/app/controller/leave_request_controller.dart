import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LeaveRequestController extends GetxController{

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];


  final selectedLeaveType = ''.obs;
  final List<String> leaveItems = [
    'Annual leave',
    'Compassionate leave',
    'Sick leave',
    'Local escort leave',
    'Abroad escort leave',
    'National service leave',
    'Event leave',
    'Hajj leave',
    'Paternity Leave',
    'Maternity Leave',
    'Leave without pay'
  ];

  var leaveTypeList = [
    'Annual leave',
    'Compassionate leave',
    'Sick leave',
    'Local escort leave',
    'Abroad escort leave',
    'National service leave',
    'Event leave',
    'Hajj leave',
    'Paternity Leave',
    'Maternity Leave',
    'Leave without pay'
  ];

  final List<String> dates = ['July 2', 'July 3', 'July 4','July 5'];
  final List<String> heading = ['Request\nRaised','Request\nAccepted','Card\nIssued','Received'];
  final List<String> statuses = ['Request\nRaised','Request\nAccepted','Card\nIssued','Received'];
  int curStep = 2; // 2 is kept minimum

  final leaveRequestHeading = 'Leave Requests'.obs;

  TextEditingController? evidenceReasonController;

  LeaveRequestController(){
    evidenceReasonController = TextEditingController();
  }

}