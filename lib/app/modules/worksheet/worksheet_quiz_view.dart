import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/bordered_button.dart';
import '../../../common/color_constants.dart';
import '../../../common/my_textform_field.dart';
import '../../../common/utils.dart';
import '../../controller/worksheet_quiz_controller.dart';


class WorksheetQuizView extends GetView<WorksheetQuizController> {
  const WorksheetQuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   // Get.lazyPut(() => WorksheetQuizController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Worksheet',
          )),
      body:
      Padding(
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
                  // if (pageIndex == 0)
                  //   Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         border:
                  //         Border.all(color: ColorConstants.borderColor)),
                  //     child: Row(
                  //       children: [
                  //         // Container(
                  //         //   margin:
                  //         //   EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  //         //   padding: EdgeInsets.all(8),
                  //         //   decoration: BoxDecoration(
                  //         //       color: Colors.white,
                  //         //       borderRadius: BorderRadius.circular(15),
                  //         //       border: Border.all(
                  //         //           color: ColorConstants.primaryColor)),
                  //         //   child: SvgPicture.asset(
                  //         //     StarIcons.studentIcon,
                  //         //     height: 5.h,
                  //         //   ),
                  //         // ),
                  //         // SizedBox(width: 1.h),
                  //         // Column(
                  //         //   crossAxisAlignment: CrossAxisAlignment.start,
                  //         //   children: [
                  //         //     addText('Sania', getNormalTextFontSIze(),
                  //         //         ColorConstants.black, FontWeight.w700),
                  //         //     SizedBox(height: 0.5.h),
                  //         //     addText('#632541', getNormalTextFontSIze() - 2,
                  //         //         ColorConstants.primaryColor, FontWeight.w700),
                  //         //     SizedBox(height: 0.5.h),
                  //         //     addText('G3-H1', getNormalTextFontSIze() - 2,
                  //         //         ColorConstants.primaryColor, FontWeight.w700),
                  //         //   ],
                  //         // )
                  //       ],
                  //     ),
                  //   ),
                  SizedBox(height: 2.h),
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
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset(
                            'assets/images/video1.png',
                            height: 22.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(65),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: ColorConstants.black.withOpacity(0.5),
                          ),
                          height: 22.h,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            'assets/images/play_new.svg',
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
                        'assets/images/playButton.svg',
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
                                      'assets/images/playButton.svg',
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

                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: '0',
                            ),
                          ),
                        )
                      ],
                    ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: (){
                      if (controller.pendingAssignmentList.length - 1 !=
                          pageIndex) {
                        print("object");
                        controller.pageController.animateToPage(pageIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      } else {
                        // showSumitSuccessfulDialogue(context, () {
                        //   Get.back();
                        //   Get.back();
                        // });
                      }
                    },
                      child: BorderedButton(width: 50.w, text: controller.pendingAssignmentList.length - 1 !=
                          pageIndex
                          ? "NEXT"
                          : "Submit",)),
                  // BaseButton(
                  //     btnType: 'large',
                  //     title: controller.pendingAssignmentList.length - 1 !=
                  //         pageIndex
                  //         ? "NEXT"
                  //         : "Submit",
                  //     onPressed: () {
                  //       if (controller.pendingAssignmentList.length - 1 !=
                  //           pageIndex) {
                  //         print("object");
                  //         controller.pageController.animateToPage(pageIndex + 1,
                  //             duration: Duration(milliseconds: 500),
                  //             curve: Curves.easeIn);
                  //       } else {
                  //         showSumitSuccessfulDialogue(context, () {
                  //           Get.back();
                  //           Get.back();
                  //         });
                  //       }
                  //     }),
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
}
