import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/star_detail_controller.dart';
import 'package:stardriver/app/modules/rating/star_rating_dialog.dart';
import 'package:stardriver/app/modules/star_details/main_location.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class StarDetailView extends GetView<StarDetailController> {
  const StarDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Star Details',
          )),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    border: Border.all(color: ColorConstants.borderColor2)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: getCustomBorderRadius(15),
                        border: Border.all(color: ColorConstants.primaryColor),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/student.svg',
                        height: getLargeTextFontSIze() * 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText('Sania', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w600),
                        SizedBox(
                          width: 30.w,
                          child: const Divider(
                            height: 5,
                            color: ColorConstants.borderColor2,
                          ),
                        ),
                        addText('#632541', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w600),
                        SizedBox(
                          width: 30.w,
                          child: const Divider(
                            height: 5,
                            color: ColorConstants.borderColor2,
                          ),
                        ),
                        buildInfoItems('Blood Type', 'A+'),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Center(
                            child: Container(
                              width: 100.w,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 20),
                              decoration: BoxDecoration(
                                  borderRadius: getCurvedBorderRadius(),
                                  border: Border.all(
                                      color: ColorConstants.borderColor),
                                  color: ColorConstants.white),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      addText(
                                          'Qr Code',
                                          getSubheadingTextFontSIze(),
                                          ColorConstants.black,
                                          FontWeight.bold),
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
                                  SvgPicture.asset(
                                    'assets/images/qrcode.svg',
                                    width: 60.w,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: SvgPicture.asset(
                        'assets/images/qrcode.svg',
                        width: 15.w,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 5,
                  top: 1,
                  bottom: 1,
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(StarRatingDialog());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: ColorConstants.white,
                          shape: BoxShape.circle,
                          boxShadow: [getBoxShadow()]),
                      child: SvgPicture.asset('assets/images/star.svg'),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          buildTabs(),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MainLocation(title: 'Main Location'),
                MainLocation(title: 'Emergency Location'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTabs() {
    return SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: controller.tabListItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedTabPosition.value = index;
                controller.tabController.index = index;
              },
              child: Obx(
                () => Container(
                  width: 40.w,
                  margin:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: controller.selectedTabPosition.value == index
                          ? ColorConstants.primaryColorLight
                          : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(
                      child: addText(
                          controller.tabListItems[index],
                          getNormalTextFontSIze(),
                          controller.selectedTabPosition.value == index
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor,
                          FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
