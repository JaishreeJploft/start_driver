import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/chat_controller.dart';
import 'package:stardriver/app/modules/chat/admins/chat_admin_view.dart';
import 'package:stardriver/app/modules/chat/staff/chat_parent.dart';
import 'package:stardriver/app/modules/chat/staff/chat_staff.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: false,
            title: 'Chats',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        'assets/images/ic_teacher.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: buildSchoolDropDown())
                    ],
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.search,
                        size: getHeadingTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: addText(
                            'Search Star,ID',
                            getNormalTextFontSIze(),
                            ColorConstants.lightTextColor,
                            FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                clipBehavior: Clip.none,
                controller: controller.controller,
                children: const [ChatStaff(),ChatPatent(), ChatAdminView()],
              ),
            )
          ],
        ),
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
              buttonWidth: double.infinity,
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

  Widget buildTabBar() {
    return Container(
      height: 5.h,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE), borderRadius: getBorderRadius()),
      child: TabBar(
        indicatorPadding: EdgeInsets.zero,
        controller: controller.controller,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        indicator: BoxDecoration(
            borderRadius: getBorderRadius(),
            color: ColorConstants.primaryColorLight,
            boxShadow: [getBoxShadow()]),
        onTap: (index) {
          Get.log('Index is $index');
          controller.selectedTabPos.value = index;
        },
        labelColor: ColorConstants.primaryColor,
        unselectedLabelColor: Colors.black,
        labelPadding: EdgeInsets.zero,
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => addText(
                    'Staff',
                    getSmallTextFontSIze() + 1,
                    controller.selectedTabPos.value == 0
                        ? ColorConstants.primaryColor
                        : ColorConstants.black,
                    controller.selectedTabPos.value == 0
                        ? FontWeight.w600
                        : FontWeight.normal)),
                const SizedBox(
                  width: 5,
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: getSmallTextFontSIze()),
                //   padding: const EdgeInsets.all(5),
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: ColorConstants.primaryColor
                //   ),child: addText('2', getSmallestTextFontSIze(), ColorConstants.etBgColor, FontWeight.normal),
                // )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => addText(
                    'Parents',
                    getSmallTextFontSIze() + 1,
                    controller.selectedTabPos.value == 1
                        ? ColorConstants.primaryColor
                        : ColorConstants.black,
                    controller.selectedTabPos.value == 1
                        ? FontWeight.w600
                        : FontWeight.normal)),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(bottom: getSmallTextFontSIze()),
                  // padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primaryColor),
                  child: Center(
                      child: addText('5', getSmallTextFontSIze(),
                          ColorConstants.etBgColor, FontWeight.normal)),
                )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => addText(
                    'Admins',
                    getSmallTextFontSIze() + 1,
                    controller.selectedTabPos.value == 2
                        ? ColorConstants.primaryColor
                        : ColorConstants.black,
                    controller.selectedTabPos.value == 2
                        ? FontWeight.w600
                        : FontWeight.normal)),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(bottom: getSmallTextFontSIze()),
                  // padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primaryColor),
                  child: Center(
                      child: addText('9', getSmallestTextFontSIze(),
                          ColorConstants.etBgColor, FontWeight.normal)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
