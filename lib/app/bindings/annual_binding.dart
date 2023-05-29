import 'package:get/get.dart';
import 'package:stardriver/app/controller/activation_controller.dart';
import 'package:stardriver/app/controller/annual_controller.dart';

class AnnualBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AnnualController>(() => AnnualController());
  }
  
}