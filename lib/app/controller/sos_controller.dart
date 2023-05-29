import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SOSController extends GetxController {
  var imageList = [
    'assets/images/breakdown.svg',
        'assets/images/accident.svg',
        'assets/images/medical_support.svg',
        'assets/images/other_sos.svg',
  ];

  var sosTitles = ['Bus Breakdown', 'Bus Accident', 'Medical Support', 'Other'];
  var imageOtherMedicalImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];

  final selectedPos = 0.obs;
  final selectedMedicalSupportPos = 0.obs;
  final selectedPassengers = <String>[].obs;
  final askForHelpSelectedPos = 0.obs;

  TextEditingController? commentController;
  var askForHelpList = [
    "I'm stuck at my location",
    "Medical Help",
    "Someone is stuck at report location",
  ];

  final count = 0.obs;


  void increment() => count.value++;

  SOSController(){
    commentController = TextEditingController();
  }

}
