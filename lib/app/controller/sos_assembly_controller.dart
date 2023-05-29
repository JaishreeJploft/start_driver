import 'package:get/get.dart';

class SosAssemblyController extends GetxController {
  final activeBox = 'remaining'.obs;
  final activeTab = 'nfc'.obs;
  final currentTab = 'remaining'.obs;
  final showFloatingButton = true.obs;


  void changeActiveBox(String box) {
    activeBox.value = box;
  }

  void changeActiveTab(String tab) {
    activeTab.value = tab;
  }

  void changeTab(String tab) {
    currentTab.value = tab;
    Get.log('currentTab.value: ${currentTab.value}');
    if (currentTab.value != 'stamped') {
      showFloatingButton.value = true;
    } else {
      showFloatingButton.value = false;
    }
  }
}
