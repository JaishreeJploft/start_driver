import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/trip_route_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import 'wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';

class TripLocationView extends GetView<TripRouteController> {
  const TripLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Location',
          )),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: getCurvedBorderRadius(),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                          border: Border.all(
                              color: ColorConstants.borderColor2, width: 2),
                          boxShadow: [getBoxShadow()]),
                      child: Image.asset('assets/images/map.png'))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 13, bottom: 13),
              child: GestureDetector(
                onTap: () {
                  Get.dialog(
                      const SuccessDialog(message: 'Successfully Notified'));
                },
                child: BorderedButton(width: 50.w, text: 'NOTIFY'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
