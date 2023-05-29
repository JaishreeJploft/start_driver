import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/events_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import '../../../common/app_header.dart';
import '../../../common/tab.dart';
import '../../../common/utils.dart';
import '../../routes/app_routes.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Events',
          )),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: getBorderRadius(),
                        border: Border.all(color: ColorConstants.borderColor),
                        color: ColorConstants.primaryColorLight),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: buildDropDown(
                      controller.schoolItems,
                      controller.selectedSchool,
                      'Hint',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  tab(),
                  SizedBox(height: 2.h),
                  Obx(
                    () => addText(
                      controller.currentTab.value,
                      18,
                      Colors.black,
                      FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  card(title: 'Peal Jam', index: 0),
                  card(title: 'Honorary Ceremony', index: 1),
                  card(title: 'Peal Jam', index: 2),
                  card(title: 'Honorary Ceremony', index: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card({required String title, required int index}) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.eventDetailsView),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0XA59F9F),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0XFFBECADA),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText(
                              title,
                              16,
                              const Color(0xff030303),
                              FontWeight.bold,
                            ),
                            // const SizedBox(height: 5),
                            // richTile(
                            //   title: 'Total Cost',
                            //   value: '2500 AED',
                            // ),
                            const SizedBox(height: 2),
                            richTile(
                              title: 'Event Date',
                              value: '15/04/2023',
                            ),
                            const SizedBox(height: 2),
                            richTile(
                              title: 'Location',
                              value: 'Liwa Tower; P.O. Box 901; Abu Dhabi',
                            ),
                          ],
                        ),
                      ),
                      controller.currentTab.value != 'Upcoming' &&
                              controller.currentTab.value != 'Concluded'
                          ? Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  addText(
                                    'Accepted',
                                    14,
                                    const Color(0xff009E10),
                                    FontWeight.bold,
                                  ),
                                  const SizedBox(height: 5),
                                  addText(
                                    'Upcoming',
                                    12,
                                    Colors.black,
                                    FontWeight.normal,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      controller.currentTab.value == 'Concluded'
                          ? addText(
                              index == 0 || index == 2
                                  ? 'Accepted'
                                  : 'Rejected',
                              14,
                              index == 0 || index == 2
                                  ? const Color(0xff009E10)
                                  : const Color(0xffF64A00),
                              FontWeight.bold,
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tab() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: tabButton(
              title: 'Upcoming',
              onTap: () => controller.changeTab('Upcoming'),
              isSelected: controller.currentTab.value == 'Upcoming',
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: tabButton(
              title: 'Accepted',
              onTap: () => controller.changeTab('Accepted'),
              isSelected: controller.currentTab.value == 'Accepted',
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: tabButton(
              title: 'Concluded',
              onTap: () => controller.changeTab('Concluded'),
              isSelected: controller.currentTab.value == 'Concluded',
            ),
          ),
        ],
      ),
    );
  }

  richTile({required String title, required String value}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Color(0XFF4C4C4C),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDown(List<String> list, RxString selectedValue, String hint) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2(
            buttonPadding: const EdgeInsets.symmetric(horizontal: 0),
            hint: Text(
              hint.tr,
              style: TextStyle(
                  fontSize: getNormalTextFontSIze(),
                  color: ColorConstants.gretTextColor),
            ),
            items: list
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: getNormalTextFontSIze(),
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue.value.isNotEmpty ? selectedValue.value : null,
            onChanged: (value) {
              selectedValue.value = value as String;
            },
            iconSize: 30,
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              size: getLargeTextFontSIze() * 1.5,
              color: ColorConstants.lightTextColor,
            ),
            buttonWidth: 100.w,
            dropdownElevation: 1,
            dropdownDecoration: BoxDecoration(
              color: ColorConstants.white,
              boxShadow: [getDeepBoxShadow()],
            ),
          )),
    );
  }
}
