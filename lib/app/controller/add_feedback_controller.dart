import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddFeedbackController extends GetxController{

  TextEditingController? titleController;
  TextEditingController? messageController;

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];

  final selectedType = 'Feedback'.obs;
  final List<String> typeItems = [
    'Feedback',
    'Help',
  ];

  final selectedWho = ''.obs;
  final List<String> optionsList = [
    'Feedback',
    'Help',
  ];

  bool isEdit = false;

  @override
  void onInit(){
    super.onInit();
    isEdit = Get.arguments['isEdit'] as bool;
  }

  AddFeedbackController(){
    titleController = TextEditingController();
    messageController = TextEditingController();
  }



}