import 'package:get/get.dart';
import 'package:stardriver/app/controller/message_controller.dart';

class MessageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
  
}