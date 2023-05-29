import 'package:get/get.dart';
import 'package:stardriver/app/controller/create_meeting_controller.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';

class ScheduleMeetingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ScheduleMeetingController>(() => ScheduleMeetingController());
    Get.lazyPut<CreateMeetingController>(() => CreateMeetingController());
  }
  
}