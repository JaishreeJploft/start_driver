import 'package:get/get.dart';
import 'package:stardriver/app/controller/rating_controller.dart';

class RatingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RatingController>(() => RatingController());
  }

}