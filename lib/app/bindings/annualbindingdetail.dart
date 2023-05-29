import 'package:get/get.dart';

import 'package:stardriver/app/controller/annual_controller.dart';
import 'package:stardriver/app/controller/scheduleController.dart';

class AnnualDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleDetailController>(() => ScheduleDetailController());
  }
}
