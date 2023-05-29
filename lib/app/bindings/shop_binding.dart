import 'package:get/get.dart';
import 'package:stardriver/app/controller/edit_order_controller.dart';
import 'package:stardriver/app/controller/orders_controller.dart';
import 'package:stardriver/app/controller/shop_controller.dart';
import 'package:stardriver/app/controller/shop_internal_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(() => ShopController());
    Get.lazyPut<OrdersController>(() => OrdersController());
    Get.lazyPut<ShopInternalController>(() => ShopInternalController());
    Get.lazyPut<EditOrderController>(() => EditOrderController());
  }

}