import 'package:get/get.dart';
import 'package:stardriver/app/controller/complain_controller.dart';
import 'package:stardriver/app/controller/raise_complain_controller.dart';

class ComplainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ComplainController>(() => ComplainController());
    Get.lazyPut<RaiseComplainController>(() => RaiseComplainController());
  }
  
}