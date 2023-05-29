import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  TextEditingController? searchController;
  final selectedPos = 0.obs;
  var optionsImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];

  SearchController() {
    searchController = TextEditingController();
  }
}
