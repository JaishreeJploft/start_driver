import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/my_route_controller.dart';

class MyRouteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyRouteController>(() => MyRouteController());
  }

}