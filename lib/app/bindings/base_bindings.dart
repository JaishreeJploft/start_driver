import 'package:get/get.dart';
import 'package:stardriver/app/controller/base_controller.dart';
import 'package:stardriver/app/controller/chat_controller.dart';
import 'package:stardriver/app/controller/home_controller.dart';
import 'package:stardriver/app/controller/my_profile_controller.dart';
import 'package:stardriver/app/controller/onboard_controller.dart';
import 'package:stardriver/app/controller/remaining_controller.dart';
import 'package:stardriver/app/controller/search_controller.dart';
import 'package:stardriver/app/controller/trip_operation_controller.dart';

class BaseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MyProfileController>(() => MyProfileController());
    Get.lazyPut<TripOperationController>(() => TripOperationController());
    Get.lazyPut<RemainingController>(() => RemainingController());
    Get.lazyPut<OnboardController>(() => OnboardController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<SearchControllers>(() => SearchControllers());
  }

}