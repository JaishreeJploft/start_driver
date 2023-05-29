import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/worksheet_quiz_controller.dart';
import 'package:stardriver/app/modules/assignments/submit_dialog.dart';
import 'package:stardriver/app/modules/assignments/utils/common_sizes.dart';
import 'package:stardriver/app/modules/assignments/utils/constant_images.dart';
import 'package:stardriver/app/modules/assignments/utils/textfieldwidget.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_app_bar.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_button.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class WorksheetQuizView extends GetView<WorksheetQuizController> {
  const WorksheetQuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WorksheetQuizController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "Worksheet"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: PageView.builder(
          itemCount: controller.pendingAssignmentList.length,
          controller: controller.pageController,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, pageIndex) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (pageIndex == 0)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: radiusAll(10),
                          border:
                              Border.all(color: ColorConstants.borderColor)),
                      child: Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, bottom: 10),
                            padding: marginSymetric(8, 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: radiusAll(15),
                                border: Border.all(
                                    color: ColorConstants.primaryColor)),
                            child: SvgPicture.asset(
                              StarIcons.studentIcon,
                              height: 5.h,
                            ),
                          ),
                          spacewidth(1.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('Ahmed', getNormalTextFontSIze(),
                                  ColorConstants.black, FontWeight.w700),
                              spaceheight(0.5.h),
                              addText('#632541', getNormalTextFontSIze() - 2,
                                  ColorConstants.primaryColor, FontWeight.w700),
                              spaceheight(0.5.h),
                              addText('G3-H1', getNormalTextFontSIze() - 2,
                                  ColorConstants.primaryColor, FontWeight.w700),
                            ],
                          )
                        ],
                      ),
                    ),
                  spaceheight(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Question: ',
                          style: TextStyle(
                              fontSize: getNormalTextFontSIze(),
                              color: ColorConstants.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "${pageIndex + 1}",
                                style: TextStyle(
                                    fontSize: getNormalTextFontSIze(),
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.w700)),
                            TextSpan(
                              text:
                                  "/${controller.pendingAssignmentList.length}",
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Marks: ',
                          style: TextStyle(
                              fontSize: getNormalTextFontSIze(),
                              color: ColorConstants.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "3",
                                style: TextStyle(
                                    fontSize: getNormalTextFontSIze(),
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  if (pageIndex == 1 || pageIndex == 3)
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: radiusAll(13),
                          child: Image.asset(
                            'assets/icon/video.png',
                            height: 22.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(65),
                          decoration: BoxDecoration(
                            borderRadius: radiusAll(13),
                            color: ColorConstants.black.withOpacity(0.5),
                          ),
                          height: 22.h,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            'assets/icon/play.svg',
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/sound 1.svg',
                        // fit: BoxFit.scaleDown,
                        height: 2.5.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                          child: addAlignedText(
                              "${controller.pendingAssignmentList[pageIndex]['question']}",
                              getHeadingTextFontSIze(),
                              ColorConstants.primaryColor,
                              FontWeight.w700)),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ListView.builder(
                    itemCount: controller
                        .pendingAssignmentList[pageIndex]['ans'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.selectedFMOPos.value = index;
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.sp),
                            margin: EdgeInsets.only(
                                bottom: 10.0, left: 5.0, right: 5.0),
                            decoration: BoxDecoration(
                                color: controller.selectedFMOPos.value == index
                                    ? ColorConstants.primaryColorLight
                                    : ColorConstants.white,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color:
                                        controller.selectedFMOPos.value == index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.borderColor),
                                boxShadow: [getBoxShadow()]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: addText(
                                        "${controller.pendingAssignmentList[pageIndex]['ans'][index]}",
                                        getSubheadingTextFontSIze(),
                                        controller.selectedFMOPos.value == index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.black,
                                        controller.selectedFMOPos.value == index
                                            ? FontWeight.w700
                                            : FontWeight.w400)),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/sound 1.svg',
                                      height: 18.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      // padding: const EdgeInsets.symmetric(horizontal: 9),
                                      decoration: BoxDecoration(
                                          color:
                                              controller.selectedFMOPos.value ==
                                                      index
                                                  ? ColorConstants.primaryColor
                                                  : ColorConstants.borderColor,
                                          boxShadow: [getLightBoxShadow()],
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorConstants.white,
                                                width: 1.5),
                                            shape: BoxShape.circle,
                                            boxShadow: [getLightBoxShadow()],
                                            color: controller
                                                        .selectedFMOPos.value ==
                                                    index
                                                ? ColorConstants.primaryColor
                                                : ColorConstants.borderColor),
                                        child: Center(
                                          child: Icon(Icons.check,
                                              color: ColorConstants.white,
                                              size: 16.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (controller.pendingAssignmentList[pageIndex]['type'] ==
                      "write")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        addText("Input Number 1 to 10", 15.sp,
                            ColorConstants.black, FontWeight.w400),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFieldWidget(
                          height: 45,
                          controller: TextEditingController(),
                          hintText: "0",
                          labelText: '',
                          borderRadius: radiusAll(10),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 3.h,
                  ),
                  BaseButton(
                      btnType: 'large',
                      title: controller.pendingAssignmentList.length - 1 !=
                              pageIndex
                          ? "NEXT"
                          : "Submit",
                      onPressed: () {
                        if (controller.pendingAssignmentList.length - 1 !=
                            pageIndex) {
                          print("object");
                          controller.pageController.animateToPage(pageIndex + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          // showCommentDialog();
                          showSumitSuccessfulDialogue(context, () {
                            Get.back();
                            Get.back();
                          });
                        }
                      }),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            );
          },
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
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   decoration: getEditTextDecoration(),
              //   child: buildLineEditText(
              //       controller.eventRejectController!,
              //       'Why are you rejecting this event?'),
              // ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  // Get.dialog(SuccessDialog2(
                  //   message: 'Rejection Sent Successfully.',
                  // ));
                },
                child: BorderedButton(width: 30.w, text: 'SUBMIT'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
