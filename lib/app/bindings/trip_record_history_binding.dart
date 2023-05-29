import 'package:get/get.dart';
import 'package:stardriver/app/controller/trip_history_record_controller.dart';


class TripHistoryRecordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TripHistoryRecordController>(() => TripHistoryRecordController());
  }

}