import 'package:get/get.dart';
import 'package:stardriver/app/controller/language_select_controller.dart';

class LanguageSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageSelectController>(
      () => LanguageSelectController(),
    );
  }
}
