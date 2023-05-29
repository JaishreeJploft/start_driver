import 'package:get/get.dart';
import 'package:stardriver/app/controller/trip_history_record_controller.dart';
import 'package:stardriver/app/controller/worksheet_controller.dart';
import 'package:stardriver/app/controller/worksheet_quiz_controller.dart';


class WorksheetQuizBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WorksheetQuizController>(() => WorksheetQuizController());
  }

}