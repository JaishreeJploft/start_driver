import 'package:flutter/material.dart';
import 'package:get/get.dart';

openTimePicker() {
  showTimePicker(
    initialTime: TimeOfDay.now(),
    context: Get.context!, //context of current state
  );
}
