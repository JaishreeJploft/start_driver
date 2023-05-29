import 'package:get/get.dart';
import 'package:stardriver/app/controller/card_and_tag_controller.dart';

class CardAndTagsBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<CardAndTagsController>(() => CardAndTagsController());
  }

}