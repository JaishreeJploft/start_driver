import 'package:get/get.dart';
import 'package:stardriver/app/controller/star_detail_controller.dart';

class StarDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StarDetailController>(() => StarDetailController());
  }
  
}