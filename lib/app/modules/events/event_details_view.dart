import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/events_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog2.dart';
import 'package:stardriver/common/base_detail_data.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/bordered_button2.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/edgy_bordered_button.dart';
import '../../../common/app_header.dart';
import '../../../common/utils.dart';

class EventDetailsView extends GetView<EventsController> {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Event Details',
          )),
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
                    Container(
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
                              'School Picnic',
                              16,
                              Colors.black,
                              FontWeight.bold,
                            ),
                            buildDivider(),
                            richTile(
                              maxLines: 20,
                              icon: 'assets/images/ic_calnedar_2.svg',
                              title: 'Create Date',
                              value: '09/09/2022',
                            ),
                            buildDivider(),
                            richTile(
                              maxLines: 20,
                              icon: 'assets/images/ic_time.svg',
                              title: 'Create Time',
                              value: '09:13pm',
                            ),
                            buildDivider(),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Event Type',
                              value: 'Inside school',
                            ),
                            buildDivider(),
                            richTile(
                              icon: 'assets/images/ic_complaints.svg',
                              title: 'Description',
                              value:
                                  'We are hosting a event as School Picnic for the stars to cheer up with the school mats inside the school will have a lot of activity to do for fun. all the interested stars can register for the event.',
                            ),
                            buildDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                richTile(
                                  maxLines: 20,
                                  icon: 'assets/images/ic_calnedar_2.svg',
                                  title: 'Start Date Time',
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
                            ),
                          ],
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

  void showCommentDialog() {
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                  addText('Event Rejection Reason', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: buildLineEditText(controller.eventRejectController!,
                    'Why are you rejecting this event?'),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.dialog(SuccessDialog2(
                    message: 'Rejection Sent Successfully.',
                  ));
                },
                child: BorderedButton(width: 30.w, text: 'SUBMIT'),
              )
            ],
          ),
        ),
      ),
    ));
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
