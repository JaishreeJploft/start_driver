import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/app/modules/schedule_meeting/sub_views/cancelled_meeting.dart';
import 'package:stardriver/app/modules/schedule_meeting/sub_views/completed_meeting.dart';
import 'package:stardriver/app/modules/schedule_meeting/sub_views/pending_meeting.dart';
import 'package:stardriver/app/modules/schedule_meeting/sub_views/planned_meeting.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/base_tab_bar.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_fab.dart';
import 'package:stardriver/common/utils.dart';

class ScheduleMeetingView extends GetView<ScheduleMeetingController>{
  const ScheduleMeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Schedule Meeting',
          )),
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Schedule\nMeeting',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.createMeeting);
      },),
      body: Column(
        children: [

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.primaryColorLight),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: buildSchoolDropDown(),
          ),
          SizedBox(
            height: 2.h,
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: BaseTabBar(
                tabController: controller.controller,
                tabList: [
              Tab(
                text: 'Pending'.tr,
              ),
              Tab(
                text: 'Planned'.tr,
              ),
              Tab(
                text: 'Cancelled'.tr,
              ),
              Tab(
                text: 'Completed'.tr,
              ),
            ]),
          ),


          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: const [
                PendingMeeting(),
                PlannedMeeting(),
                CancelledMeeting(),
                CompletedMeeting(),
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: controller.schoolItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.gretTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: controller.selectedSchool.value,
          onChanged: (value) {
            controller.selectedSchool.value = value.toString();
          },
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze() * 1.5,
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 78.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: const Offset(-20, 0),
        ),
      )),
    );
  }

}