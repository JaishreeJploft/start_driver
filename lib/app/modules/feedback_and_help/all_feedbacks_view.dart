import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/feedback_controller.dart';
import 'package:stardriver/app/modules/feedback_and_help/feedback_elements.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/delete_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class AllFeedbacksView extends GetView<FeedbackController> {
  const AllFeedbacksView({super.key, required this.type});
  final int type;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildComplainList(context),
      ),
    );
  }

  Widget buildComplainList(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return
          Column(
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
                            type == 2
                                ? 'App is not working'
                                : 'Behaviour is not good',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold),
                      ),
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
                      SizedBox(
                        width: 3.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          // showCommentDialog();
                          Get.toNamed(Routes.addFeedbackView,
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
                  buildLongReason('user2', 'Star', 'Najma Suha-il'),
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
                  buildLongReason('ic_feedback_type', 'Type', 'Help'),
                  buildDivider(),
                  buildLongReason(
                      'ic_feedback_type', 'Help For', 'App not Working'),
                  buildDivider(),
                  buildLongReason('ic_complaints', 'Message',
                      "Hi, I'm facing some issues with the application's speed..it's not working as fast as I expect."),
                  if (index != 0) buildDivider(),
                  if (index != 0)
                    buildLongReason('ic_chat', 'Reply',
                        'Thanks for your feedback, the support team will solve the issue and update you.'),

                  if (index == 3) buildDivider(),
                  if (index == 3)
                    buildLongReason(
                        'ic_chat', 'Comment', 'Thank you for taking action'),

                  if (index != 0) buildDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  if (index != 0)
                    SizedBox(
                      height: 4.h,
                      child: Row(
                        children: List.generate(
                          controller.feedbackList.length,
                          (index) => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedFeedbackPos.value = index;
                                if (index == 1) {
                                  showCommentDialog(
                                      controller.commentcontroller!);
                                }
                              },
                              child: Container(
                                height: 4.h,
                                margin: const EdgeInsets.only(right: 10),
                                decoration:
                                    controller.selectedFeedbackPos.value ==
                                            index
                                        ? getPrimaryDecoration3()
                                        : getEditTextDecoration(),
                                child: Center(
                                  child: addText(
                                    controller.feedbackList[index],
                                    getSmallTextFontSIze(),
                                    controller.selectedFeedbackPos.value ==
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

                      //  ListView.builder(
                      //   itemCount: controller.feedbackList.length,
                      //   scrollDirection: Axis.horizontal,
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemBuilder: (context, index) {
                      //     return Obx(() => GestureDetector (
                      //       onTap: (){
                      //         controller.selectedFeedbackPos.value = index;
                      //       },
                      //       child: Container(
                      //         height: 4.h,
                      //         width: 22.w,
                      //         margin: const EdgeInsets.only(right: 10),
                      //         decoration: controller.selectedFeedbackPos.value == index ? getPrimaryDecoration3() : getEditTextDecoration(),
                      //         child: Center(child: addText(controller.feedbackList[index], getSmallTextFontSIze(), controller.selectedFeedbackPos.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.normal)),
                      //       ),
                      //     ));
                      //   },
                      // ),
                    ),
                  buildDivider(),
                  // StepProgressView(width: MediaQuery.of(context).size.width,
                  //     curStep: controller.curStep,
                  //     statuses: controller.heading,
                  //     color: ColorConstants.primaryColor,
                  //     titles: controller.dates),

                  if (index == 0)
                    StepProgressView(
                        width: MediaQuery.of(context).size.width,
                        curStep: 2,
                        statuses: controller.heading,
                        color: ColorConstants.primaryColor,
                        titles: const ['July 2', '', '']),

                  if (index == 1)
                    StepProgressView(
                        width: MediaQuery.of(context).size.width,
                        curStep: 3,
                        statuses: controller.heading,
                        color: ColorConstants.primaryColor,
                        titles: const ['July 2', 'July 3', '      ']),

                  if (index == 2)
                    StepProgressView(
                        width: MediaQuery.of(context).size.width,
                        curStep: 4,
                        statuses: controller.heading,
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
        );
      },
    );
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
