import 'package:get/get.dart';
import 'package:stardriver/app/controller/task_reminder_controller.dart';

class TaskAndReminderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TaskAndReminderController>(() => TaskAndReminderController());
  }

}