import 'package:get/get.dart';
import 'package:stardriver/app/controller/activation_controller.dart';

class ActivationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ActivationController>(() => ActivationController());
  }
  
}