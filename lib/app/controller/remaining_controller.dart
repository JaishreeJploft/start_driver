import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RemainingController extends GetxController{

  final selectedPos = 0.obs;
  var optionsImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];
  TextEditingController? commentController;
  final selectedStatusPos = 0.obs;
  var statusList = [
    'Onboard',
    'Late',
    'Not Show',
    'Request to Admin: Someone Else Came to Pickup',
  ];
  final isNFCQRChecked = false.obs;

  RemainingController(){
    commentController = TextEditingController();
  }

}