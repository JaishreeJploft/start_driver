import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopInternalController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController shopTabController;
  final selectedShopTabPosition = 0.obs;
  var shopTabListItems = ["Stars Store", "Canteen"];
  late TextEditingController searchController;


  var categoryList = ['All', 'Category 1', 'Category 2','Category 3'];
  final selectedCategoryPos = 2.obs;

  final imageList = [
    'assets/images/nfc1.png',
    'assets/images/nfc2.png',
    'assets/images/nfc3.png',
    'assets/images/nfc4.png',
  ];


  final canteenImageList = [
    'assets/images/img_shop_canteen1.png',
    'assets/images/img_shop_canteen2.png',
    'assets/images/img_shop_canteen3.png',
  ];

  ShopInternalController(){
    shopTabController = TabController(length: 2, vsync: this);
    searchController = TextEditingController();
  }

}