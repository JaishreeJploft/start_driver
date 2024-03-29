import 'package:get/get.dart';
import 'package:stardriver/app/controller/auth_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(),);
  }
}
