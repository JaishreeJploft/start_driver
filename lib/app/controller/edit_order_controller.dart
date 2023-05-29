import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditOrderController extends GetxController{


  final  friendsRadioValue = 'Deliver to School'.obs;
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

  EditOrderController(){
    cardNumberController = TextEditingController();
    cardExpiryController = TextEditingController();
    cardHolderNameController = TextEditingController();
  }

}