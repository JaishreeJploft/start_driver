import 'package:get/get.dart';
import 'package:stardriver/app/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
  
}