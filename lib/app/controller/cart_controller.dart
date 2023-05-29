import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController{


  final  friendsRadioValue = 'Pick-up from school.'.obs;
  final  servingRadioValue = 'Deliver'.obs;
  final  orderTypeRadioValue = 'Every Week'.obs;

  TextEditingController? cardNumberController;
  TextEditingController? cardExpiryController;
  TextEditingController? cardHolderNameController;

  final daysList = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ].obs;
  final selectedIndexes = <String>[].obs;

  CartController(){
    cardNumberController = TextEditingController();
    cardExpiryController = TextEditingController();
    cardHolderNameController = TextEditingController();
  }

}