import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/task_reminder_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/floating_action_button_widget.dart';
import 'package:stardriver/common/utils.dart';


import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/detail_row_widget.dart';

class TaskAndReminderView extends GetView<TaskAndReminderController>{
  const TaskAndReminderView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child:  AppHeader(
            showBackIcon: true,
            title: 'Task or Reminder',
          )),
      floatingActionButton:BaseFloatingActionButton(onTap: () {
        controller.isEdit = false;
        Get.toNamed(Routes.addTaskReminder);
      }, floatingText: "Add Task"),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const SizedBox(height: 15,),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: getCurvedBorderRadius()
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/task_reminder.svg"),
                        const SizedBox(width: 15,),
                        addText("Submit your daily log", 15, Colors.black, FontWeight.w700)
                      ],
                    ),
                    buildDivider(),
                    DetailsRow(detailsLabel: '09:14pm', detailsValue: '',icon: "assets/images/ic_time.svg",),
                    buildDivider(),
                    DetailsRow(detailsLabel: 'Remind Star', detailsValue: 'Daily',icon: "assets/images/bell.svg",),

                    buildDivider(),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.doc_text,size: 16,color: ColorConstants.primaryColor,),
                        const SizedBox(width: 5,),
                        addText("File : ", 14, Colors.black, FontWeight.w400),
                        addText(" str_task.file", 14, ColorConstants.primaryColor, FontWeight.w700),
                        const SizedBox(width: 5,),
                        const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,size: 16,),
                        const SizedBox(width: 5,),
                        const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,size: 16),
                      ],
                    ),
                    buildDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              // pushTo(context, SetRemainder_Screen(isEdit: true,));
                              controller.isEdit = true;
                              Get.toNamed(Routes.addTaskReminder);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Card(
                                  color: controller.selectedTabIndex.value == 1
                                      ? ColorConstants.primaryColorLight
                                      : const Color(0xFFFFFFFF),
                                  elevation: controller.selectedTabIndex.value == 1 ? 5 : 0,
                                  shape: controller.selectedTabIndex.value == 1
                                      ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorConstants.primaryColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0))
                                      :  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFBECADA), width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: addarialText(
                                        "Edit".toUpperCase(),
                                        controller.selectedTabIndex.value == 1
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor,
                                        14,
                                        FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {

                              controller.selectedTabIndex.value = 2;

                              showcancelremainderDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Card(
                                  color: controller.selectedTabIndex.value == 2
                                      ? ColorConstants.primaryColorLight
                                      : const Color(0xFFFFFFFF),
                                  elevation: controller.selectedTabIndex.value == 2 ? 5 : 0,
                                  shape: controller.selectedTabIndex.value == 2
                                      ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorConstants.primaryColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0))
                                      :  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFBECADA), width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: addarialText(
                                        "Delete".toUpperCase(),
                                        controller.selectedTabIndex.value == 2
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor,
                                        14,
                                        FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: getCurvedBorderRadius()
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/task_reminder.svg"),
                        const SizedBox(width: 15,),
                        addText("You have second school", 15, Colors.black, FontWeight.w700)
                      ],
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/ic_time.svg"),
                        const SizedBox(width: 5,),
                        addText("09:14pm", 14, Colors.black, FontWeight.w400)
                      ],
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/bell.svg"),
                        const SizedBox(width: 5,),
                        addText("Remind Star : ", 14, Colors.black, FontWeight.w400),
                        addText(" Mon. Wed, Fri", 14, ColorConstants.primaryColor, FontWeight.w700)
                      ],
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.doc_text,size: 16,color: ColorConstants.primaryColor,),
                        const SizedBox(width: 5,),
                        addText("File : ", 14, Colors.black, FontWeight.w400),
                        addText(" str_task.file", 14, ColorConstants.primaryColor, FontWeight.w700),
                        const SizedBox(width: 5,),
                        const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,size: 16,),
                        const SizedBox(width: 5,),
                        const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,size: 16),
                      ],
                    ),
                    buildDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              // pushTo(context, SetRemainder_Screen(isEdit: true,));
                              controller.isEdit = true;
                              Get.toNamed(Routes.addTaskReminder);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Card(
                                  color: controller.selectedTabIndex.value == 1
                                      ? ColorConstants.primaryColorLight
                                      : const Color(0xFFFFFFFF),
                                  elevation: controller.selectedTabIndex.value == 1 ? 5 : 0,
                                  shape: controller.selectedTabIndex.value == 1
                                      ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorConstants.primaryColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0))
                                      :  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFBECADA), width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: addarialText(
                                        "Edit".toUpperCase(),
                                        controller.selectedTabIndex.value == 1
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor,
                                        14,
                                        FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {

                              controller.selectedTabIndex.value = 2;

                              showcancelremainderDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Card(
                                  color: controller.selectedTabIndex.value == 2
                                      ? ColorConstants.primaryColorLight
                                      : const Color(0xFFFFFFFF),
                                  elevation: controller.selectedTabIndex.value == 2 ? 5 : 0,
                                  shape: controller.selectedTabIndex.value == 2
                                      ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorConstants.primaryColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0))
                                      :  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFBECADA), width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: addarialText(
                                        "Delete".toUpperCase(),
                                        controller.selectedTabIndex.value == 2
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor,
                                        14,
                                        FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: getCurvedBorderRadius()
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/task_reminder.svg"),
                        const SizedBox(width: 15,),
                        addText("School Event Planing", 15, Colors.black, FontWeight.w700)
                      ],
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/ic_calendar.svg",height: 14,),
                            const SizedBox(width: 5,),
                            addText("01/03/2022", 14, Colors.black, FontWeight.w400)
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/ic_time.svg"),
                            const SizedBox(width: 5,),
                            addText("09:14pm", 14, Colors.black, FontWeight.w400)
                          ],
                        ),
                      ],
                    ),
                    buildDivider(),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.doc_text,size: 16,color: ColorConstants.primaryColor,),
                        const SizedBox(width: 5,),
                        addText("File : ", 14, Colors.black, FontWeight.w400),
                        addText(" str_task.file", 14, ColorConstants.primaryColor, FontWeight.w700),
                        const SizedBox(width: 5,),
                        const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,size: 16,),
                        const SizedBox(width: 5,),
                        const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,size: 16),
                      ],
                    ),
                    buildDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              // pushTo(context, SetRemainder_Screen(isEdit: true,));
                              controller.isEdit = true;
                              Get.toNamed(Routes.addTaskReminder);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Card(
                                  color: controller.selectedTabIndex.value == 1
                                      ? ColorConstants.primaryColorLight
                                      : const Color(0xFFFFFFFF),
                                  elevation: controller.selectedTabIndex.value == 1 ? 5 : 0,
                                  shape: controller.selectedTabIndex.value == 1
                                      ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorConstants.primaryColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0))
                                      :  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFBECADA), width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: addarialText(
                                        "Edit".toUpperCase(),
                                        controller.selectedTabIndex.value == 1
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor,
                                        14,
                                        FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {

                              controller.selectedTabIndex.value = 2;

                              showcancelremainderDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Card(
                                  color: controller.selectedTabIndex.value == 2
                                      ? ColorConstants.primaryColorLight
                                      : const Color(0xFFFFFFFF),
                                  elevation: controller.selectedTabIndex.value == 2 ? 5 : 0,
                                  shape: controller.selectedTabIndex.value == 2
                                      ? RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: ColorConstants.primaryColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0))
                                      :  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFBECADA), width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    alignment: Alignment.center,
                                    height: 35,
                                    child: addarialText(
                                        "Delete".toUpperCase(),
                                        controller.selectedTabIndex.value == 2
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor,
                                        14,
                                        FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
          ],
        ),
      ),
    );
  }



}