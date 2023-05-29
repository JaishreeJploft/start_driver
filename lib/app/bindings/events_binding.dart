import 'package:get/get.dart';
import 'package:stardriver/app/controller/events_controller.dart';

class EventsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EventsController>(() => EventsController());
  }

}