import 'package:get/get.dart';
import 'package:stardriver/app/controller/purchase_controller.dart';
import 'package:stardriver/app/controller/wallet_controller.dart';

class WalletBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
    Get.lazyPut<PurchaseController>(() => PurchaseController());
  }
  
}