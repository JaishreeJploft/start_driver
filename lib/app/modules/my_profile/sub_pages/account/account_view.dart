import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/my_profile_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AccountView extends GetView<MyProfileController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.attendanceView);
              },
              child: buildItem('My Attendance'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.performanceView);
              },
              child: buildItem('My Performance'),
            ),
            SizedBox(
              height: 1.h,
            ),

            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.earlyLeave);
              },
              child: buildItem('Early Leave'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.leavePermission);
              },
              child: buildItem('Leave Permission'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.leaveRequestView);
              },
              child: buildItem('Leave Requests'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.medicalRecordView);
              },
              child: buildItem('Medical Records'),
            ),
            SizedBox(
              height: 1.h,
            ),

            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.notificationSettings);
              },
              child: buildItem('Notification Settings'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.annualSchedule);
              },
              child: buildItem('Annual Schedule'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.complainView);
              },
              child: buildItem('Complaints & Reports'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.feedbackView);
              },
              child: buildItem('Feedback & Help'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.cardTagsView);
              },
              child: buildItem('Card & Tags'),
            ),
            SizedBox(
              height: 1.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.walletView,
                    arguments: {'heading': 'Wallet'});
              },
              child: buildItem('Wallet'),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.primaryColor),
          borderRadius: getBorderRadius()),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          addText(title, getSubheadingTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.normal),
          const Icon(
            Icons.arrow_forward,
            color: ColorConstants.primaryColor,
          )
        ],
      ),
    );
  }
}
