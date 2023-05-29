import 'package:get/get.dart';
import 'package:stardriver/app/controller/call_controller.dart';

class CallBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CallController>(() => CallController());
  }
  
}