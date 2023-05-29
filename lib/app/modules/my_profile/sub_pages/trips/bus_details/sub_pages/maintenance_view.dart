import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/bus_detail_controller.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import '../../../../../../../common/custom_stepper.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../feedback_and_help/feedback_elements.dart';
import '../../../../../wallet/sub_pages/purchase/add_money_dialogs/delete_dialog.dart';

class MaintenanceView extends GetView<BusDetailController> {
   MaintenanceView({super.key, required this.type});

  final int? type;
  final List<String> dates = ['July 2', 'July 3', 'July 4'];
  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved'
  ];
  int curStep = 3; // 2 is kept minimum
  var feedbackList = [ 'COMMENT','ACCEPT'];
  final selectedFeedbackPos = 1.obs;
   TextEditingController? commentcontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return type == 0
              ? buildMaintenanceItem(index, context)
              : buildWeekRecordItem(index, context);
        },
      ),
    );
  }

  Widget buildMaintenanceItem(int index, BuildContext context) {
    return index == 0?
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              boxShadow: [getBoxShadow()],
              borderRadius: getBorderRadius(),
              color: ColorConstants.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: addText(
                          'Maintenance service ${index+1} 1000 kms',
                          getNormalTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        // showCommentDialog();
                        Get.toNamed(Routes.editRecordView,
                            arguments: {'isEdit': true});
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_edit.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const DeleteDialog(
                            message:
                            'Are you sure you want to delete this?'));
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_delete.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    ),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/ic_calendar.svg',
                            height: getHeadingTextFontSIze()),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('01/03/2022', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_time.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('09:13pm', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         SizedBox(
                         width: 200,
                          child:  buildLongReason(
                              'ic_feedback_type', 'Doc', 'doc_bus_001.pdf'),
                        ),


                        const SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDocumentPopup(context, 'Feedback & Help');
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.download_for_offline,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),



                      ],
                    ),

                  ],
                ),
                buildDivider(),
                buildLongReason(
                    'ic_feedback_type', 'Description', 'Bus AC not working'),
                buildDivider(),
                // buildLongReason(
                //     'ic_feedback_type', 'Feedback', 'The support team will solve the issue within 24 hours.'),
                // const SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   height: 4.h,
                //   child: Row(
                //     children: List.generate(
                //       feedbackList.length,
                //           (index) => Expanded(
                //         child: GestureDetector(
                //           onTap: () {
                //             selectedFeedbackPos.value = index;
                //             if (index == 1) {
                //               showCommentDialog(
                //                   commentcontroller!);
                //             }
                //           },
                //           child: Container(
                //             height: 4.h,
                //             margin: const EdgeInsets.only(right: 10),
                //             decoration:
                //             selectedFeedbackPos.value ==
                //                 index
                //                 ? getPrimaryDecoration3()
                //                 : getEditTextDecoration(),
                //             child: Center(
                //               child: addText(
                //                 feedbackList[index],
                //                 getSmallTextFontSIze(),
                //                 selectedFeedbackPos.value ==
                //                     index
                //                     ? ColorConstants.primaryColor
                //                     : ColorConstants.borderColor,
                //                 FontWeight.normal,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // buildDivider(),
                // if (index != 0) buildDivider(),
                //   buildLongReason('ic_chat', 'Comment',
                //       'But I need assistance within the hour.'),
                // buildDivider(),
                if (index == 0)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 2,
                      statuses:heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', '', '']),
                if (index == 1)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 3,
                      statuses: heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', 'July 3', '      ']),
                if (index == 2)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 4,
                      statuses: heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', 'July 3', 'July 4']),
              ],
            ),
          ),
          if (index == 2)
            SizedBox(
              height: 15.h,
            )
        ],
      ),
    ):index == 1?Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              boxShadow: [getBoxShadow()],
              borderRadius: getBorderRadius(),
              color: ColorConstants.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: addText(
                          'Maintenance service ${index+1} 1000 kms',
                          getNormalTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        // showCommentDialog();
                        Get.toNamed(Routes.editRecordView,
                            arguments: {'isEdit': true});
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_edit.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const DeleteDialog(
                            message:
                            'Are you sure you want to delete this?'));
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_delete.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    ),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/ic_calendar.svg',
                            height: getHeadingTextFontSIze()),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('01/03/2022', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_time.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('09:13pm', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child:  buildLongReason(
                              'ic_feedback_type', 'Doc', 'doc_bus_001.pdf'),
                        ),


                        const SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDocumentPopup(context, 'Feedback & Help');
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.download_for_offline,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),



                      ],
                    ),

                  ],
                ),
                buildDivider(),
                buildLongReason(
                    'ic_feedback_type', 'Description', 'Bus AC not working'),
                buildDivider(),
                buildLongReason(
                    'ic_feedback_type', 'Feedback', 'The support team will solve the issue within 24 hours.'),
                buildDivider(),
                SizedBox(
                  height: 4.h,
                  child: Row(
                    children: List.generate(
                      feedbackList.length,
                          (index) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedFeedbackPos.value = index;
                            if (index == 1) {
                              showCommentDialog(
                                  commentcontroller!);
                            }
                          },
                          child: Container(
                            height: 4.h,
                            margin: const EdgeInsets.only(right: 10),
                            decoration:
                            selectedFeedbackPos.value ==
                                index
                                ? getPrimaryDecoration3()
                                : getEditTextDecoration(),
                            child: Center(
                              child: addText(
                                feedbackList[index],
                                getSmallTextFontSIze(),
                                selectedFeedbackPos.value ==
                                    index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.borderColor,
                                FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // buildDivider(),
                // if (index != 0) buildDivider(),
                // buildLongReason('ic_chat', 'Comment',
                //     'But I need assistance within the hour.'),
                buildDivider(),
                if (index == 0)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 2,
                      statuses:heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', '', '']),
                if (index == 1)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 3,
                      statuses: heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', 'July 3', '      ']),
                if (index == 2)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 4,
                      statuses: heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', 'July 3', 'July 4']),
              ],
            ),
          ),
          if (index == 2)
            SizedBox(
              height: 15.h,
            )
        ],
      ),
    ):Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              boxShadow: [getBoxShadow()],
              borderRadius: getBorderRadius(),
              color: ColorConstants.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: addText(
                          'Maintenance service ${index+1} 1000 kms',
                          getNormalTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        // showCommentDialog();
                        Get.toNamed(Routes.editRecordView,
                            arguments: {'isEdit': true});
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_edit.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(const DeleteDialog(
                            message:
                            'Are you sure you want to delete this?'));
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_delete.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    ),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/ic_calendar.svg',
                            height: getHeadingTextFontSIze()),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('01/03/2022', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_time.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('09:13pm', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                buildDivider(),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child:  buildLongReason(
                              'ic_feedback_type', 'Doc', 'doc_bus_001.pdf'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDocumentPopup(context, 'Feedback & Help');
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.download_for_offline,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        ),



                      ],
                    ),

                  ],
                ),
                buildDivider(),
                buildLongReason(
                    'ic_feedback_type', 'Description', 'Bus AC not working'),
                buildDivider(),
                buildLongReason(
                    'ic_feedback_type', 'Feedback', 'The support team will solve the issue within 24 hours.'),

                // SizedBox(
                //   height: 4.h,
                //   child: Row(
                //     children: List.generate(
                //       feedbackList.length,
                //           (index) => Expanded(
                //         child: GestureDetector(
                //           onTap: () {
                //             selectedFeedbackPos.value = index;
                //             if (index == 1) {
                //               showCommentDialog(
                //                   commentcontroller!);
                //             }
                //           },
                //           child: Container(
                //             height: 4.h,
                //             margin: const EdgeInsets.only(right: 10),
                //             decoration:
                //             selectedFeedbackPos.value ==
                //                 index
                //                 ? getPrimaryDecoration3()
                //                 : getEditTextDecoration(),
                //             child: Center(
                //               child: addText(
                //                 feedbackList[index],
                //                 getSmallTextFontSIze(),
                //                 selectedFeedbackPos.value ==
                //                     index
                //                     ? ColorConstants.primaryColor
                //                     : ColorConstants.borderColor,
                //                 FontWeight.normal,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                buildDivider(),
                // if (index != 0) buildDivider(),
                buildLongReason('ic_chat', 'Comment',
                    'But I need assistance within the hour.'),
                buildDivider(),
                if (index == 0)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 2,
                      statuses:heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', '', '']),
                if (index == 1)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 3,
                      statuses: heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', 'July 3', '      ']),
                if (index == 2)
                  StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 4,
                      statuses: heading,
                      color: ColorConstants.primaryColor,
                      titles: const ['July 2', 'July 3', 'July 4']),
              ],
            ),
          ),
          if (index == 2)
            SizedBox(
              height: 15.h,
            )
        ],
      ),
    );

    //   Container(
    //   width: 100.w,
    //   margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
    //   decoration: BoxDecoration(
    //       boxShadow: [getDeepBoxShadow()],
    //       borderRadius: getBorderRadius(),
    //       color: ColorConstants.white,
    //       border: Border.all(color: ColorConstants.borderColor2)),
    //   child: Row(
    //     children: [
    //       Container(
    //         width: 20.w,
    //         padding: const EdgeInsets.symmetric(vertical: 8),
    //         decoration: BoxDecoration(
    //             borderRadius: getBorderRadius(),
    //             border: Border.all(color: ColorConstants.primaryColor),
    //             color: ColorConstants.primaryColorLight),
    //         child: Column(
    //           children: [
    //             addText('10', getLargeTextFontSIze() - 2,
    //                 ColorConstants.primaryColor, FontWeight.bold),
    //             addText('September', getSmallTextFontSIze(),
    //                 ColorConstants.primaryColor, FontWeight.normal),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           addText(
    //               'Maintenance service ${index + 1}',
    //               getNormalTextFontSIze(),
    //               ColorConstants.black,
    //               FontWeight.bold),
    //           const SizedBox(
    //             height: 2,
    //           ),
    //           addText(
    //               // 'Service ${index + 1} - ${index + 1}000 kms',
    //               '${index + 1}000 kms',
    //               getNormalTextFontSIze(),
    //               ColorConstants.black,
    //               FontWeight.bold),
    //         ],
    //       ),
    //       const Spacer(),
    //       Row(
    //         children: [
    //           GestureDetector(
    //             onTap: () {},
    //             child: const Icon(
    //               Icons.download_for_offline,
    //               color: ColorConstants.primaryColor,
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               showWeekRecord(context, index);
    //             },
    //             child: const Icon(
    //               Icons.remove_red_eye_outlined,
    //               color: ColorConstants.primaryColor,
    //             ),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //     ],
    //   ),
    // );

  }

  Widget buildWeekRecordItem(int index, BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          boxShadow: [getDeepBoxShadow()],
          borderRadius: getBorderRadius(),
          color: ColorConstants.white,
          border: Border.all(color: ColorConstants.borderColor2)),
      child: Row(
        children: [
          Container(
            width: 20.w,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                border: Border.all(color: ColorConstants.primaryColor),
                color: ColorConstants.primaryColorLight),
            child: Column(
              children: [
                addText('10', getLargeTextFontSIze() - 2,
                    ColorConstants.primaryColor, FontWeight.bold),
                addText('kms', getSmallTextFontSIze(),
                    ColorConstants.primaryColor, FontWeight.normal),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addText('08 August - 12 August', getNormalTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  addText('Current kms :', getSmallTextFontSIze() + 1,
                      ColorConstants.black, FontWeight.bold),
                  addText(' 3800 kms', getSmallTextFontSIze() + 1,
                      ColorConstants.primaryColor, FontWeight.bold),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.download_for_offline,
                  color: ColorConstants.primaryColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showWeekRecord(context, index);
                },
                child: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  showWeekRecord(BuildContext context, int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,
            scrollable: true,
            title: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: addAlignedText(
                      "Bus Week Record",
                      getHeadingTextFontSIze(),
                      ColorConstants.black,
                      FontWeight.w600),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      ),
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: getCurvedBorderRadius()),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addText('08 August - 12 August', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addText('Last Week kms', getSmallTextFontSIze() + 1,
                            ColorConstants.black, FontWeight.normal),
                        addText(' : 3800 km', getSmallTextFontSIze() + 1,
                            ColorConstants.primaryColor, FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: getEditTextDecoration(),
                      child: addEditText2(
                          controller.currentKmController!, 'Current kms'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 13),
                      decoration: getEditTextDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('Upload File', getNormalTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal),
                          SvgPicture.asset('assets/images/ic_upload.svg'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: BorderedButton(width: 40.w, text: 'SUBMIT'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            )));
  }
   buildLongReason(String image, String title, String description) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SvgPicture.asset(
           'assets/images/$image.svg',
           height: getHeadingTextFontSIze(),
         ),
         const SizedBox(
           width: 10,
         ),
         Expanded(
           child: Text.rich(
               textAlign: TextAlign.start,
               TextSpan(
                   style: TextStyle(fontSize: 15.sp),
                   children: [

                     TextSpan(
                         text: "$title : ",
                         style: const TextStyle(
                           color: ColorConstants.black,
                           fontWeight: FontWeight.normal,
                         )
                     ),
                     TextSpan(
                         text: description,
                         style: const TextStyle(
                           color: ColorConstants.primaryColor,
                           fontWeight: FontWeight.bold,
                         )
                     )
                   ]
               )
           ),
         ),
       ],
     );
     //   Row(
     //   crossAxisAlignment: CrossAxisAlignment.start,
     //   children: [
     //     SvgPicture.asset(
     //       'assets/images/$image.svg',
     //       height: getHeadingTextFontSIze(),
     //     ),
     //     const SizedBox(
     //       width: 10,
     //     ),
     //     addText(title, getSmallTextFontSIze() + 1, ColorConstants.black,
     //         FontWeight.normal),
     //     Expanded(
     //       child: addText(' : $description', getSmallTextFontSIze() + 1,
     //           ColorConstants.primaryColor, FontWeight.bold),
     //     ),
     //   ],
     // );
   }
}
