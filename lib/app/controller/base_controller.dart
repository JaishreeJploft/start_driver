import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardriver/common/bottom_app_bar/curved_navigation_bar.dart';

class BaseController extends GetxController{

  final currentIndex = 2.obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

}