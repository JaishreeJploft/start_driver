import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

class ScheduleDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  CarouselController? carouselController;
  late TabController controller;
  TextEditingController? reasonController;

  final calendarSelectedPos = 1.obs;

  EventList<Event> markedDateMap = EventList<Event>(
    events: {},
  );

  ScheduleDetailController() {
    carouselController = CarouselController();
    controller = TabController(vsync: this, length: 3);
    reasonController = TextEditingController();
  }

  @override
  void onInit() {
    super.onInit();
    markedDateMap.add(
        DateTime(2023, 1, 9),
        Event(
          date: DateTime(2023, 1, 9),
          title: 'Event 5',
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            // color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
          // icon: _eventIcon,
        ));

    markedDateMap.add(
        DateTime(2023, 1, 25),
        Event(
          date: DateTime(2023, 1, 25),
          title: 'Event 5',
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            // color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
          // icon: _eventIcon,
        ));
  }
}
