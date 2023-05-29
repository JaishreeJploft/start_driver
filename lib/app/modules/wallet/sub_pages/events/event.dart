import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stardriver/app/controller/wallet_controller.dart';
import 'package:stardriver/common/color_constants.dart';

class Event extends GetView<WalletController>{
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
    );
  }

}