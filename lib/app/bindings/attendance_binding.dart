import 'package:get/get.dart';
import 'package:stardriver/app/controller/attendance_controller.dart';

class AttendanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() => AttendanceController());
  }

}