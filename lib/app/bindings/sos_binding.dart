import 'package:get/get.dart';
import 'package:stardriver/app/controller/sos_assembly_controller.dart';
import 'package:stardriver/app/controller/sos_controller.dart';

class SOSBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SOSController>(() => SOSController());
    Get.lazyPut<SosAssemblyController>(() => SosAssemblyController());
  }
  
}