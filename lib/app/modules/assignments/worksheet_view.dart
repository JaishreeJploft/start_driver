import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/constant_images.dart';
import 'package:stardriver/app/modules/assignments/utils/sizes.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_app_bar.dart';
import 'package:stardriver/app/modules/assignments/worksheet_quiz_view.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class MyWorkSheetView extends GetView {
  const MyWorkSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Worksheet'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => WorksheetQuizView());
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
                              addText(
                                'How to Drive Safely',
                                16,
                                Colors.black,
                                FontWeight.bold,
                              ),
                              // buildDivider(),
                              // richTile(
                              //   maxLines: 20,
                              //   icon: 'assets/images/ic_calnedar_2.svg',
                              //   title: 'Create Date',
                              //   value: '09/09/2022',
                              // ),
                              // buildDivider(),
                              // richTile(
                              //   maxLines: 20,
                              //   icon: 'assets/images/ic_time.svg',
                              //   title: 'Create Time',
                              //   value: '09:13pm',
                              // ),
                              // buildDivider(),
                              // richTile(
                              //   icon: 'assets/images/ic_complaints.svg',
                              //   title: 'Event Type',
                              //   value: 'Inside school',
                              // ),
                              buildDivider(),
                              richTile(
                                icon: StarIcons.reasonIcon,
                                title: 'Description',
                                value:
                                    'Please upload your medical information by attending this survey so we have the details about your health.',
                              ),
                              buildDivider(),
                              richTile(
                                maxLines: 20,
                                icon: StarIcons.groupIcon,
                                title: 'Assigned By',
                                value: 'Rashid Khan (Nurse)',
                              ),
                              buildDivider(),
                              richTile(
                                maxLines: 20,
                                icon: StarIcons.fileIcon,
                                title: 'Worksheet No',
                                value: 'W01111',
                              ),
                              buildDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/calendar.svg',
                                    title: 'Post Date',
                                    value: '09/09/2022',
                                  ),
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/time_icon.svg',
                                    title: 'Post Time',
                                    value: '09:13pm',
                                  ),
                                ],
                              ),
                              buildDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/calendar.svg',
                                    title: 'Due Date',
                                    value: '09/09/2022',
                                  ),
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/time_icon.svg',
                                    title: 'Due Time',
                                    value: '09:13pm',
                                  ),
                                ],
                              ),

                              /* richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'Start Destination',
                                  value: 'Ignite Public School',
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_calnedar_2.svg',
                                      title: 'End Date Time',
                                      value: '09/09/2022',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_time.svg',
                                      title: '09:13pm',
                                      value: '',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'End Destination',
                                  value: 'Ignite Public School',
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_calnedar_2.svg',
                                      title: 'Reporting Date Time',
                                      value: '09/09/2022',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_time.svg',
                                      title: '09:13pm',
                                      value: '',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_calnedar_2.svg',
                                      title: 'End for Registration',
                                      value: '09/09/2022',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_time.svg',
                                      title: '09:13pm',
                                      value: '',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_complaints.svg',
                                      title: 'Transport Facility',
                                      value: 'No',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      title: 'Canteen Facility',
                                      value: 'Yes',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/user2.svg',
                                        title: 'Staff',
                                        value: '2',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Teacher',
                                        value: '3',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/user2.svg',
                                        title: 'Nurse',
                                        value: '1',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Security Staff',
                                        value: '1',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Entrance Cost',
                                  value: '10 AED',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Trip Cost',
                                  value: '50 AED',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Food Cost ',
                                  value: '40 AED',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Cost Per Star',
                                  value: '100 AED',
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/ic_complaints.svg',
                                        title: 'Grade',
                                        value: 'Grade4',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Class',
                                        value: 'H1, H2, H3',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'Stars',
                                  value: '40',
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/ic_complaints.svg',
                                        title: 'Grade',
                                        value: 'Grade5',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Class',
                                        value: 'H1, H2, H3',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Stars',
                                  value: '40',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Total Passenger',
                                  value: '86',
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                                barrierDismissible: true,
                                                const SuccessDialog(
                                                  message: 'You have successfully accepted this event',
                                                ));
                                          },
                                          child: EdgyBorderedButton(
                                            text: 'ACCEPTED',
                                            width: 100.w,
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showCommentDialog();
                                        },
                                        child: EdgyBorderedButtonOutline(
                                          text: 'REJECT',
                                          width: 100.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),*/
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => WorksheetQuizView());
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
                              addText(
                                'How to Drive Safely',
                                16,
                                Colors.black,
                                FontWeight.bold,
                              ),
                              // buildDivider(),
                              // richTile(
                              //   maxLines: 20,
                              //   icon: 'assets/images/ic_calnedar_2.svg',
                              //   title: 'Create Date',
                              //   value: '09/09/2022',
                              // ),
                              // buildDivider(),
                              // richTile(
                              //   maxLines: 20,
                              //   icon: 'assets/images/ic_time.svg',
                              //   title: 'Create Time',
                              //   value: '09:13pm',
                              // ),
                              // buildDivider(),
                              // richTile(
                              //   icon: 'assets/images/ic_complaints.svg',
                              //   title: 'Event Type',
                              //   value: 'Inside school',
                              // ),
                              buildDivider(),
                              richTile(
                                icon: StarIcons.reasonIcon,
                                title: 'Description',
                                value:
                                    'Please upload your medical information by attending this survey so we have the details about your health.',
                              ),
                              buildDivider(),
                              // richTile(
                              //   maxLines: 20,
                              //   icon: 'assets/images/ic_complaints.svg',
                              //   title: 'Assigned By',
                              //   value: 'Rashid Khan (Nurse)',
                              // ),
                              // buildDivider(),
                              richTile(
                                maxLines: 20,
                                icon: StarIcons.reasonIcon,
                                title: 'Worksheet No',
                                value: 'W01111',
                              ),
                              buildDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/calendar.svg',
                                    title: 'Post Date',
                                    value: '09/09/2022',
                                  ),
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/time_icon.svg',
                                    title: 'Post Time',
                                    value: '09:13pm',
                                  ),
                                ],
                              ),
                              buildDivider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/calendar.svg',
                                    title: 'Due Date',
                                    value: '09/09/2022',
                                  ),
                                  richTile(
                                    maxLines: 20,
                                    icon: 'assets/icon/time_icon.svg',
                                    title: 'Due Time',
                                    value: '09:13pm',
                                  ),
                                ],
                              ),

                              /* richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'Start Destination',
                                  value: 'Ignite Public School',
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_calnedar_2.svg',
                                      title: 'End Date Time',
                                      value: '09/09/2022',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_time.svg',
                                      title: '09:13pm',
                                      value: '',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'End Destination',
                                  value: 'Ignite Public School',
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_calnedar_2.svg',
                                      title: 'Reporting Date Time',
                                      value: '09/09/2022',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_time.svg',
                                      title: '09:13pm',
                                      value: '',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_calnedar_2.svg',
                                      title: 'End for Registration',
                                      value: '09/09/2022',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_time.svg',
                                      title: '09:13pm',
                                      value: '',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    richTile(
                                      maxLines: 20,
                                      icon: 'assets/images/ic_complaints.svg',
                                      title: 'Transport Facility',
                                      value: 'No',
                                    ),
                                    richTile(
                                      maxLines: 20,
                                      title: 'Canteen Facility',
                                      value: 'Yes',
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/user2.svg',
                                        title: 'Staff',
                                        value: '2',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Teacher',
                                        value: '3',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/user2.svg',
                                        title: 'Nurse',
                                        value: '1',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Security Staff',
                                        value: '1',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Entrance Cost',
                                  value: '10 AED',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Trip Cost',
                                  value: '50 AED',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Food Cost ',
                                  value: '40 AED',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Estimated Cost Per Star',
                                  value: '100 AED',
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/ic_complaints.svg',
                                        title: 'Grade',
                                        value: 'Grade4',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Class',
                                        value: 'H1, H2, H3',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_complaints.svg',
                                  title: 'Stars',
                                  value: '40',
                                ),
                                buildDivider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        icon: 'assets/images/ic_complaints.svg',
                                        title: 'Grade',
                                        value: 'Grade5',
                                      ),
                                    ),
                                    Expanded(
                                      child: richTile(
                                        maxLines: 20,
                                        title: 'Class',
                                        value: 'H1, H2, H3',
                                      ),
                                    ),
                                  ],
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Stars',
                                  value: '40',
                                ),
                                buildDivider(),
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/user2.svg',
                                  title: 'Total Passenger',
                                  value: '86',
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                                barrierDismissible: true,
                                                const SuccessDialog(
                                                  message: 'You have successfully accepted this event',
                                                ));
                                          },
                                          child: EdgyBorderedButton(
                                            text: 'ACCEPTED',
                                            width: 100.w,
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showCommentDialog();
                                        },
                                        child: EdgyBorderedButtonOutline(
                                          text: 'REJECT',
                                          width: 100.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),*/
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

class BaseDetailData extends StatelessWidget {
  final String icon;
  final String detailsLable;
  final String detailsValue;

  const BaseDetailData(
      {Key? key,
      this.icon = "",
      required this.detailsLable,
      this.detailsValue = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            if (icon != "")
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: SvgPicture.asset(
                    icon,
                    height: 2.h,
                    width: 2.h,
                  ),
                ),
              ),
            TextSpan(
                text: "${detailsLable} ",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )),
            if (detailsValue != "")
              TextSpan(
                text: " :  $detailsValue",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.sp,
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
