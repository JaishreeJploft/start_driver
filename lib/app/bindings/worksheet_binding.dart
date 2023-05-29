import 'package:get/get.dart';
import 'package:stardriver/app/controller/trip_history_record_controller.dart';
import 'package:stardriver/app/controller/worksheet_controller.dart';


class WorksheetBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WorksheetController>(() => WorksheetController());
  }

}