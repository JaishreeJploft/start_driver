import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> openDatePicker(
    {DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    VoidCallback? onDateSelected}) async {
  final DateTime? picked = await showDatePicker(
    context: Get.context!,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(2015, 8),
    lastDate: lastDate ?? DateTime(2101),
  );
  if (picked != null && onDateSelected != null) {
    onDateSelected!();
  }
}
