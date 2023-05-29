import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stardriver/app/modules/assignments/assignment_quiz_view.dart';
import 'package:stardriver/app/modules/assignments/awareness_controller.dart';
import 'package:stardriver/app/modules/assignments/utils/constant_images.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_app_bar.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_tab_button.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_toggle_tab_bar.dart';
import 'package:stardriver/app/modules/assignments/worksheet_view.dart';
import 'package:stardriver/common/color_constants.dart';
import '../../../../common/utils.dart';

class Awareness extends GetView<AwarenessController> {
  const Awareness({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AwarenessController>(
      () => AwarenessController(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Awareness & Courses'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => BaseToggleTabBar(
                      controller: controller.tabController,
                      tabs: [
                        BaseTabButton(
                            title: "Ongoing",
                            isSelected: controller.tabControllerPos.value == 0),
                        BaseTabButton(
                            title: "Submited",
                            isSelected: controller.tabControllerPos.value == 1),
                        BaseTabButton(
                            title: "Overdue",
                            isSelected: controller.tabControllerPos.value == 2),
                      ],
                      onTap: (int index) {
                        controller.tabControllerPos.value = index;
                        print(
                            "controller.lostandfoundTabPos.value ${controller.tabControllerPos.value}");
                      }),
                ),
                spaceheight(20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return card(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget card(index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Get.to(() => AssignmentsQuizView());

          // Get.toNamed(Routes.worksheetQuizView);
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
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
                    addText(
                      'Assignments ${index + 1}',
                      16,
                      Colors.black,
                      FontWeight.bold,
                    ),
                    const Spacer(),
                    // SvgPicture.asset(
                    //   'assets/images/saveIcon.svg',
                    //   height: 20,
                    //   width: 20,
                    // ),
                  ],
                ),
                buildDivider(),
                richTile(
                  icon: StarIcons.reasonIcon,
                  title: 'Assignment Number',
                  value: '1155',
                ),
                buildDivider(),
                richTile(
                  icon: StarIcons.reasonIcon,
                  title: 'Assignment type',
                  value: 'worksheet',
                ),
                buildDivider(),
                richTile(
                  maxLines: 20,
                  // icon: StarIcons.groupIcon,
                  icon: "assets/icon/assigned.svg",
                  title: 'Assigned To',
                  value: 'Rashid Khan (Nurse)',
                ),
                buildDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: richTile(
                        maxLines: 20,
                        icon: 'assets/icon/calendar.svg',
                        title: 'Post Date',
                        value: '09/09/2022',
                      ),
                    ),
                    Expanded(
                      child: richTile(
                        maxLines: 20,
                        icon: 'assets/icon/time_icon.svg',
                        title: 'Post Time',
                        value: '09:13pm',
                      ),
                    ),
                  ],
                ),
                buildDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: richTile(
                        maxLines: 20,
                        icon: 'assets/icon/calendar.svg',
                        title: 'Submit Date',
                        value: '09/09/2022',
                      ),
                    ),
                    Expanded(
                      child: richTile(
                        maxLines: 20,
                        icon: 'assets/icon/time_icon.svg',
                        title: 'Submit Time',
                        value: '09:13pm',
                      ),
                    ),
                  ],
                ),
                buildDivider(),
                richTile(
                  maxLines: 20,
                  icon: 'assets/icon/calendar.svg',
                  title: 'Due Date',
                  value: '01/03/2022',
                ),
                buildDivider(),
                richTile(
                  maxLines: 20,
                  icon: 'assets/icon/time_icon.svg',
                  title: 'Assigned Time',
                  value: '9:30 AM',
                ),
                buildDivider(),
                Row(
                  children: [
                    addText(
                      'food_allergy.doc',
                      14,
                      ColorConstants.primaryColor,
                      FontWeight.w700,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/eyeIcon.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/icon/download.svg',
                          height: 17,
                          width: 17,
                        ),
                      ],
                    )
                  ],
                ),
                buildDivider(),
                addText(
                  'https://website.com',
                  14,
                  ColorConstants.primaryColor,
                  FontWeight.w700,
                ),
                buildDivider(),
                // spaceheight(10),
                // Row(
                //   children: [
                //     Expanded(
                //       child: BaseButton(
                //         title: 'STOP POST',
                //         onPressed: () {},
                //         btnType: 'medium',
                //         isActive: false,
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     Expanded(
                //       child: BaseButton(
                //         title: 'POST',
                //         onPressed: () {},
                //         btnType: 'medium',
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox spaceheight(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget richTile({
    String? icon,
    double iconSize = 13,
    required String title,
    required String value,
    decoration = false,
    TextStyle? titleStyle,
    TextStyle? valueStyle,
    bool isCenter = false,
    double? maxLines,
    WidgetSpan? widgetSpan,
    double height = 1,
  }) {
    return BaseDetailData(
      detailsLable: title,
      detailsValue: value,
      icon: icon ?? '',
    );
  }
}
