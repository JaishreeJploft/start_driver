import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController with GetTickerProviderStateMixin{

  late TabController orderTabController;
  final selectedOrderTabPosition = 0.obs;
  var orderTabListItems = ["Shop Orders", "Canteen Orders"];


  late TabController weekTabController;
  final selectedWeekTabPosition = 0.obs;
  var weekTabListItems = ["This Week", "Every Week"];


  int curStep = 3; // 2 is kept minimum
  var feedbackList = ['ESCALATE', 'COMMENTS', 'ACCEPT'];
  final selectedFeedbackPos = 2.obs;
  final List<String> dates = ['July 2', 'July 3', 'July 4'];
  final List<String> heading = [
    "Order\nPlaced",
    "Ready for\nCollection",
    "Completed"
  ];

  OrdersController(){
    orderTabController = TabController(length: 2, vsync: this);
    weekTabController = TabController(length: 2, vsync: this);
  }

}