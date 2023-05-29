import 'package:get/get.dart';

class CreateMeetingController extends GetxController{

  final selectedRole = ''.obs;
  final List<String> roleList = [
    'Teacher',
    'Driver',
    'Admin'
  ];


  final selectedMeetingType = ''.obs;
  final List<String> meetingTypeList = [
    'Audio Meeting',
    'Video Meeting',
  ];




}