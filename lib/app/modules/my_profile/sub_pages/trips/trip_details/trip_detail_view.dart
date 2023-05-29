import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/trip_detail_controller.dart';
import 'package:stardriver/app/modules/rating/star_rating_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class TripDetailView extends GetView<TripDetailController> {
  const TripDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Trip Details',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            decoration: BoxDecoration(
                color: ColorConstants.white,
                boxShadow: [getDeepBoxShadow()],
                border:
                    Border.all(color: ColorConstants.primaryColor, width: 1.5),
                borderRadius: getCurvedBorderRadius()),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText(
                                '1st Pickup Trip',
                                getSubheadingTextFontSIze(),
                                ColorConstants.primaryColor,
                                FontWeight.w700),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/route.svg',
                                    color: ColorConstants.primaryColor),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Route 1',
                                    getNormalTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/passengers.svg',
                                    color: ColorConstants.primaryColor),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Passenger : 30',
                                    getNormalTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.tripRouteView);
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/stop.svg',
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  addText(
                                      'Stops : 12',
                                      getNormalTextFontSIze(),
                                      ColorConstants.primaryColor,
                                      FontWeight.w700),
                                ],
                              ),
                            ),
                            buildDivider(),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.tripRouteView),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/passengers.svg',
                                      color: ColorConstants.primaryColor),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  addText(
                                      'Emergency Pickup : 3',
                                      getNormalTextFontSIze(),
                                      ColorConstants.primaryColor,
                                      FontWeight.w700),
                                ],
                              ),
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_driver.svg',
                                  color: ColorConstants.primaryColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Driver : Riyaz Ahmad',
                                    getNormalTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_bus.svg',
                                  color: ColorConstants.primaryColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Bus No : UAE 0001',
                                    getNormalTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_supervisor.svg',
                                  color: ColorConstants.primaryColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Supervisor : Rayyan',
                                    getNormalTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.w700),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  addText(
                                      'Start Time',
                                      getSmallTextFontSIze(),
                                      ColorConstants.primaryColor,
                                      FontWeight.w700),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: getPrimaryDecoration(),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        ColorConstants.primaryColor,
                                        FontWeight.w700),
                                  ),
                                  addText(
                                      ' : ',
                                      getSmallTextFontSIze(),
                                      ColorConstants.primaryColor,
                                      FontWeight.w700),
                                  Container(
                                    decoration: getPrimaryDecoration(),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        ColorConstants.primaryColor,
                                        FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  addText(
                                      'End Time',
                                      getSmallTextFontSIze(),
                                      ColorConstants.primaryColor,
                                      FontWeight.w700),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // const Spacer(),
                                  Container(
                                    decoration: getPrimaryDecoration(),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        ColorConstants.primaryColor,
                                        FontWeight.w700),
                                  ),
                                  addText(
                                      ' : ',
                                      getSmallTextFontSIze(),
                                      ColorConstants.primaryColor,
                                      FontWeight.w700),
                                  Container(
                                    decoration: getPrimaryDecoration(),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        ColorConstants.primaryColor,
                                        FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                decoration: BoxDecoration(
                                    color: ColorConstants.primaryColorLight,
                                    boxShadow: [getDeepBoxShadow()],
                                    border: Border.all(
                                        color: ColorConstants.primaryColor,
                                        width: 1.5),
                                    borderRadius: getBorderRadiusCircular()),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  child: Center(
                                    child: addText(
                                        'START',
                                        getSmallTextFontSIze(),
                                        ColorConstants.primaryColor,
                                        FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: addText('Passenger List', getSubheadingTextFontSIze(),
                ColorConstants.black, FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildPassengerItem(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildDivider() {
    return SizedBox(
        width: 40.w,
        child: Divider(
          color: ColorConstants.primaryColor.withOpacity(0.1),
          thickness: 2,
        ));
  }

  Widget buildPassengerItem(int index) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.starDetailView),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                border:
                    Border.all(color: ColorConstants.borderColor2, width: 2),
                borderRadius: getCurvedBorderRadius(),
                color: ColorConstants.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.primaryColor),
                      borderRadius: getCustomBorderRadius(15),
                      color: ColorConstants.white),
                  child: SvgPicture.asset(
                    'assets/images/student.svg',
                    height: getHeadingTextFontSIze() * 2 + 5,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText('Sania(Star)', getNormalTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.w500),
                    addText('#646537', getNormalTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.w500),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoItems('Mobile No', '0503664321'),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(
                                const ClipboardData(text: "0503664321"));
                            showToast('Number copied to clipboard');
                          },
                          child: Icon(
                            Icons.copy,
                            color: ColorConstants.primaryColor,
                            size: getHeadingTextFontSIze(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.tripRouteView);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/ic_map.svg'),
                      const SizedBox(
                        height: 5,
                      ),
                      addText('Map', getSmallTextFontSIze(),
                          ColorConstants.black, FontWeight.normal)
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.messageView);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/ic_chat.svg'),
                      const SizedBox(
                        height: 5,
                      ),
                      addText('Chat', getSmallTextFontSIze(),
                          ColorConstants.black, FontWeight.normal)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              left: 10,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primaryColor,
                      boxShadow: [getDeepBoxShadow()]),
                  child: Center(
                      child: addText(
                          (index + 1).toString(),
                          getNormalTextFontSIze(),
                          ColorConstants.white,
                          FontWeight.normal)))),
          Positioned(
              top: 0,
              bottom: 0,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Get.dialog(StarRatingDialog());
                },
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.white,
                        boxShadow: [getDeepBoxShadow()]),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/star.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}
