import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/notification_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_switch.dart';
import 'package:stardriver/common/custom_switch2.dart';
import 'package:stardriver/common/utils.dart';

class NotificationSettingsView extends GetView<NotificationController>{
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(5.h),
    child: AppHeader(
    showBackIcon: true,
    title: 'Notification Settings',
    )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Wallet Credit/Debits',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.wallets.value,
                  // enableColor: ColorConstants.primaryColor,
                  // disableColor: ColorConstants.lightGreyColor,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.wallets.value = !controller.wallets.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Performance Rating Received',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.performanceRating.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.performanceRating.value = !controller.performanceRating.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Changes on Trips',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),

                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.changesOnTrips.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.changesOnTrips.value = !controller.changesOnTrips.value;
                  },))
              ],
            ),

            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Event Updates',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.eventUpdates.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.eventUpdates.value = !controller.eventUpdates.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Stars chats',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),

                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.starsChats.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.starsChats.value = !controller.starsChats.value;
                  },))
              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Parents chats',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),
                Obx(() => CustomSwitch(
                      key: GlobalKey(),
                      value: controller.parentChats.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                      width: 48,
                      height: 24,
                      switchHeight: 20,
                      switchWidth: 20,
                  onChanged: (bool value) {
                    controller.parentChats.value = !controller.parentChats.value;
                  },))


              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Admin chats',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),


                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.adminChats.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.adminChats.value = !controller.adminChats.value;
                  },))

              ],
            ),
            getLightDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText(
                    'Bus Departure time',
                    getSubheadingTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.w500),



                Obx(() => CustomSwitch(
                  key: GlobalKey(),
                  value: controller.busDepartureTime.value,
                  enableColor: ColorConstants.primaryColorLight,
                  disableColor: ColorConstants.lightGreyColor,
                  width: 48,
                  height: 24,
                  switchHeight: 20,
                  switchWidth: 20,
                  onChanged: (bool value) {
                    controller.busDepartureTime.value = !controller.busDepartureTime.value;
                  },))


              ],
            ),




          ],
        ),
      ),
    );
  }

}