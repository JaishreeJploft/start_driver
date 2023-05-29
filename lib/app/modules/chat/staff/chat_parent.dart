import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/chat_controller.dart';
import 'package:stardriver/app/modules/chat/staff/group.dart';
import 'package:stardriver/app/modules/chat/staff/individual.dart';
import 'package:stardriver/common/color_constants.dart';

import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ChatPatent extends GetView<ChatController> {
  const ChatPatent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          buildTabs(),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: TabBarView(
              clipBehavior: Clip.none,
              controller: controller.staffTabController,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                IndividualChats(role: "parent",),
                GroupChats(role: "parent",),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTabs() {
    return SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: controller.tabListItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedTabPosition.value = index;
                controller.staffTabController.index = index;
              },
              child: Obx(
                    () => Container(
                  width: 40.w,
                  margin:
                  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: controller.selectedTabPosition.value == index
                          ? ColorConstants.primaryColorLight
                          : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(
                      child: addText(
                          controller.tabListItems[index],
                          getNormalTextFontSIze(),
                          controller.selectedTabPosition.value == index
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor,
                          FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
