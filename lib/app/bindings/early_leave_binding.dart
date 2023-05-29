import 'package:get/get.dart';
import 'package:stardriver/app/controller/early_leave_controller.dart';

class EarlyLeaveBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EarlyLeaveController>(() => EarlyLeaveController());
  }
  
}