import 'package:get/get.dart';
import 'package:stardriver/app/controller/bus_detail_controller.dart';
import 'package:stardriver/app/controller/trip_detail_controller.dart';
import 'package:stardriver/app/controller/trip_route_controller.dart';

class BusDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusDetailController>(() => BusDetailController());
    Get.lazyPut<TripRouteController>(() => TripRouteController());
    Get.lazyPut<TripDetailController>(() => TripDetailController());
  }
}
