
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController with GetTickerProviderStateMixin{

  var purchaseTabListItems = ["Transaction", "Top Up Record"];
  late TabController purchaseTabController;
  final selectedPurchaseTabPosition = 0.obs;
  TextEditingController? amountController;
  TextEditingController? cardNumberController;
  TextEditingController? cardExpiryController;
  TextEditingController? cardHolderNameController;
  final amountText = 'AED 10'.obs;

  PurchaseController(){
    purchaseTabController = TabController(length: 2, vsync: this);
    amountController = TextEditingController();
    cardNumberController = TextEditingController();
    cardExpiryController = TextEditingController();
    cardHolderNameController = TextEditingController();
  }


}