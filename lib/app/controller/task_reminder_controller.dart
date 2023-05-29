import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskAndReminderController extends GetxController {

  final selectedTabIndex = 1.obs;

  bool isEdit = false;



  final remainder="daily".obs;
  final isShowDate=false.obs;
  var specficdaylistoption=[];
  List<String> specficdaylist=[
    "Monday ","Tuesday",
    "Wednesday","Thursday",
    "Friday","Saturday",
    "Sunday"
  ];
  addDayList(value,isAdd){
    isAdd?specficdaylistoption.add(value):specficdaylistoption.remove(value);

  }
  getremainderValue(remainderValue,isShowDateValue){
    remainder.value=remainderValue;
    isShowDate.value=isShowDateValue;
  }

  TextEditingController reminderController = TextEditingController(text: 'daily');
  TextEditingController uploadfileController = TextEditingController(text: 'doc.pdf');



}