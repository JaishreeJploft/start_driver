import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivationController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController controller;

  ActivationController(){
    controller = TabController(length: 2, vsync: this);
  }

}