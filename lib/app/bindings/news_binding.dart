import 'package:get/get.dart';
import 'package:stardriver/app/controller/news_controller.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
  
}