import 'package:get/get.dart';
import 'package:stardriver/app/controller/add_feedback_controller.dart';
import 'package:stardriver/app/controller/feedback_controller.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(() => FeedbackController());
    Get.lazyPut<AddFeedbackController>(() => AddFeedbackController());
  }

}