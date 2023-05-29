import 'package:get/get.dart';
import 'package:stardriver/app/controller/performance_controller.dart';

class PerformanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PerformanceController>(() => PerformanceController());
  }
  
}