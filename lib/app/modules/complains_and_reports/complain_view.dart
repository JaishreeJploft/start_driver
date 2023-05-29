import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/complain_controller.dart';
import 'package:stardriver/app/modules/complains_and_reports/all_complain_view.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/base_tab_bar.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_fab.dart';
import 'package:stardriver/common/utils.dart';

class ComplainView extends GetView<ComplainController> {
  const ComplainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(
          isIcon: true,
          icon: Icons.add,
          buttonText: 'Complain or\nReport',
          onButtonClicked: () => Get.toNamed(Routes.raiseComplain, arguments: {'isEdit': false})),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Complaints & Report',
          )),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
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
            child: BaseTabBar(tabController: controller.controller, tabList: [
              Tab(
                text: 'All'.tr,
              ),
              Tab(
                text: 'Complaints'.tr,
              ),
              Tab(
                text: 'Reports'.tr,
              ),
            ]),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: const [
                AllComplaints(),
                AllComplaints(),
                AllComplaints(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => SizedBox(
            height: 30,
            child: DropdownButtonHideUnderline(
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
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
                dropdownElevation: 1,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                // offset: const Offset(-20, 0),
              ),
            ),
          )),
    );
  }
}
