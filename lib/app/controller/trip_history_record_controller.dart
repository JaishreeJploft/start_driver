import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TripHistoryRecordController extends GetxController{

  TextEditingController? searchController;
  CarouselController? carouselController;

  TripHistoryRecordController(){
    carouselController = CarouselController();
    searchController = TextEditingController();
  }

}