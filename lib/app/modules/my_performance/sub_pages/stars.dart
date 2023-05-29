import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/performance_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class Stars extends GetView<PerformanceController> {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                addText('Filter By:', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
                Expanded(
                    child: SizedBox(
                  height: 6.h,
                  child: ListView.builder(
                    itemCount: 5,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          controller.starsFilterSelectedPos.value = index;
                        },
                        child: Obx(
                          () => Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1.h),
                            decoration: BoxDecoration(
                                color: controller
                                            .starsFilterSelectedPos.value ==
                                        index
                                    ? ColorConstants.primaryColorLight
                                    : ColorConstants.white,
                                boxShadow:
                                    controller.starsFilterSelectedPos.value ==
                                            index
                                        ? [getDeepBoxShadow()]
                                        : null,
                                border:
                                    controller.starsFilterSelectedPos.value ==
                                            index
                                        ? Border.all(
                                            color: ColorConstants.primaryColor,
                                            width: 1.5)
                                        : Border.all(
                                            color: ColorConstants.borderColor2,
                                            width: 1.5),
                                borderRadius: getBorderRadius()),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  addText(
                                      (index + 1).toString(),
                                      getSubheadingTextFontSIze(),
                                      controller.starsFilterSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.black,
                                      FontWeight.bold),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Image.asset(
                                    'assets/images/star.png',
                                    height: getLargeTextFontSIze(),
                                    color: controller
                                                .starsFilterSelectedPos.value ==
                                            index
                                        ? null
                                        : ColorConstants.primaryColor
                                            .withOpacity(0.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ))
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildRatingItem(index, context);
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget buildRatingItem(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          border: Border.all(color: ColorConstants.borderColor2)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getLargeTextFontSIze(),
                child: ListView.builder(
                  itemCount: 2,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/star.png',
                      height: getLargeTextFontSIze(),
                      color: ColorConstants.primaryColor.withOpacity(0.5),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Tooltip(
                showDuration: const Duration(seconds: 10),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                textStyle: TextStyle(
                  color: ColorConstants.primaryColor,
                  fontSize: 1.8.h - 1,
                ),
                decoration: BoxDecoration(
                  color: ColorConstants.secondaryColor,
                  border: Border.all(color: ColorConstants.primaryColor),
                  // boxShadow: [getDeepBoxShadow()],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                message:
                    'Perrformance is not good, he dont know how to talk and drive bus. Management is also very poor',
                triggerMode: TooltipTriggerMode.tap,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      border: Border.all(color: ColorConstants.primaryColor),
                      color: ColorConstants.primaryColorLight),
                  child: addAlignedText(
                      'Performance is not good',
                      getNormalTextFontSIze(),
                      ColorConstants.primaryColor,
                      FontWeight.normal),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              addText('Tue, July 19', getSmallestTextFontSIze(),
                  ColorConstants.lightTextColor, FontWeight.normal)
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/ic_time.svg',
                color: ColorConstants.primaryColor,
                height: getHeadingTextFontSIze(),
              ),
              SizedBox(
                width: 2.w,
              ),
              addText('09:13pm', getSmallTextFontSIze(), ColorConstants.black,
                  FontWeight.normal),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                'assets/images/ic_teacher.svg',
                color: ColorConstants.primaryColor,
                height: getHeadingTextFontSIze(),
              ),
              SizedBox(
                width: 2.w,
              ),
              addText('Nora', getSmallTextFontSIze(), ColorConstants.black,
                  FontWeight.normal),
              SizedBox(
                width: 2.w,
              ),
              addText('(Class V)', getSmallTextFontSIze(),
                  ColorConstants.primaryColor, FontWeight.normal),
            ],
          )
        ],
      ),
    );
  }
}
