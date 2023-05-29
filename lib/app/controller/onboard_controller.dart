import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController{

  final selectedPos = 0.obs;
  var optionsImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];
  TextEditingController? commentController;
  final selectedStatusPos = 0.obs;
  var statusList = [
    'Stamped by Mistake ',
    'Return to Home After Stamped',
    'Left the Bus with Someone'
  ];

  OnboardController(){
    commentController = TextEditingController();
  }

}