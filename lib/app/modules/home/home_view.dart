import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/home_controller.dart';
import 'package:stardriver/app/modules/home/trip_info.dart';
import 'package:stardriver/app/modules/news/news_details_screen.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/drawer.dart';
import 'package:stardriver/common/utils.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.key.currentState!.openDrawer();
                      },
                      child: SvgPicture.asset(
                        'assets/images/ic_menu.svg',
                        height: getHeadingTextFontSIze() + 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.sosView);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_sos.svg',
                            height: getLargeTextFontSIze() * 1.3,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.notificationView);
                            },
                            child: SvgPicture.asset(
                                'assets/images/notification.svg',
                                height: getLargeTextFontSIze() * 1.2),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: getCustomBorderRadius(15),
                      border: Border.all(color: ColorConstants.borderColor2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const TripInfo(
                              header: 'This Week',
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/ic_calendar.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              addText('This Week', getNormalSmallTextFontSIze(),
                                  ColorConstants.black, FontWeight.w400)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                        child: const VerticalDivider(
                          color: ColorConstants.borderColor2,
                          thickness: 1,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const TripInfo(
                              header: 'Trips Completed',
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SvgPicture.asset('assets/images/trips_completed.svg'),
                              SvgPicture.asset('assets/images/nav_trip.svg'),
                              const SizedBox(
                                width: 5,
                              ),
                              addText(
                                  'Trip Completed 10',
                                  getNormalSmallTextFontSIze(),
                                  ColorConstants.black,
                                  FontWeight.w400)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Today Schedule', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.w700),
                    GestureDetector(
                        onTap: () => Get.to(const TripInfo(
                              header: 'Today Schedule',
                            )),
                        child: addUnderlineLineText(
                            'View All',
                            getNormalSmallTextFontSIze(),
                            ColorConstants.primaryColor,
                            FontWeight.w400))
                  ],
                ),
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildScheduleItem(index);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        addText('News / Broadcast', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.w700),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: ColorConstants.primaryColor,
                              shape: BoxShape.circle),
                          child: addText('10', getSmallestTextFontSIze(),
                              ColorConstants.white, FontWeight.normal),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.newsView);
                      },
                      child: addUnderlineLineText(
                          'View All',
                          getNormalSmallTextFontSIze(),
                          ColorConstants.primaryColor,
                          FontWeight.w400),
                    )
                  ],
                ),
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildNewsItem(index);
                  },
                ),
                SizedBox(
                  height: 5.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildScheduleItem(int index) {
    return FadeInRight(
      duration: Duration(milliseconds: 200 * (index + 1)),
      child: GestureDetector(
        onTap: () async {
          controller.scheduleSelectedPos.value = index;
          Get.toNamed(Routes.tripDetailView);
        },
        child: Obx(
          () => Container(
            width: 100.w,
            margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0),
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            decoration: BoxDecoration(
                color: ColorConstants.white,
                boxShadow: [getDeepBoxShadow()],
                border: controller.scheduleSelectedPos.value == index
                    ? Border.all(color: ColorConstants.primaryColor, width: 1.5)
                    : null,
                borderRadius: getCurvedBorderRadius()),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // addText('${controller.getNumberSuffix(index+1)} Pickup Trip', getNormalTextFontSIze(), controller.scheduleSelectedPos.value == index ? ColorConstants.primaryColor : ColorConstants.gretTextColor, FontWeight.w900),
                            addText(
                                controller.scheduleSelectedPos.value == index
                                    ? "2nd Trip"
                                    : '1st Pickup Trip',
                                getNormalTextFontSIze(),
                                controller.scheduleSelectedPos.value == index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.gretTextColor,
                                FontWeight.w900),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/route.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Route 1',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/passengers.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Passenger : 30',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
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
                                    controller.scheduleSelectedPos.value == index
                                        ? 'assets/images/stop.svg'
                                        : 'assets/images/ic_stop_grey.svg',
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  addText(
                                      'Stops : 12',
                                      getNormalTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                ],
                              ),
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/passengers.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Emergency Pickup : 3',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_driver.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Driver : Riyaz Ahmad',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_bus.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Bus No : UAE 0001',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
                                    FontWeight.w700),
                              ],
                            ),
                            buildDivider(),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_supervisor.svg',
                                  color: controller.scheduleSelectedPos.value ==
                                          index
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.gretTextColor,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                addText(
                                    'Supervisor : Rayyan',
                                    getNormalTextFontSIze(),
                                    controller.scheduleSelectedPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.gretTextColor,
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
                                      'Start in',
                                      getSmallTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: controller
                                                .scheduleSelectedPos.value ==
                                            index
                                        ? getPrimaryDecoration()
                                        : BoxDecoration(
                                            borderRadius: getEdgyBorderRadius(),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.borderColor),
                                            color: ColorConstants.etBgColor),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        controller.scheduleSelectedPos.value ==
                                                index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.gretTextColor,
                                        FontWeight.w700),
                                  ),
                                  addText(
                                      ' : ',
                                      getSmallTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                  Container(
                                    decoration: controller
                                                .scheduleSelectedPos.value ==
                                            index
                                        ? getPrimaryDecoration()
                                        : BoxDecoration(
                                            borderRadius: getEdgyBorderRadius(),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.borderColor),
                                            color: ColorConstants.etBgColor),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        controller.scheduleSelectedPos.value ==
                                                index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.gretTextColor,
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
                                      'Start time',
                                      getSmallTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: controller
                                                .scheduleSelectedPos.value ==
                                            index
                                        ? getPrimaryDecoration()
                                        : BoxDecoration(
                                            borderRadius: getEdgyBorderRadius(),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.borderColor),
                                            color: ColorConstants.etBgColor),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        controller.scheduleSelectedPos.value ==
                                                index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.gretTextColor,
                                        FontWeight.w700),
                                  ),
                                  addText(
                                      ' : ',
                                      getSmallTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                  Container(
                                    decoration: controller
                                                .scheduleSelectedPos.value ==
                                            index
                                        ? getPrimaryDecoration()
                                        : BoxDecoration(
                                            borderRadius: getEdgyBorderRadius(),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.borderColor),
                                            color: ColorConstants.etBgColor),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        controller.scheduleSelectedPos.value ==
                                                index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.gretTextColor,
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
                                      'End time',
                                      getSmallTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: controller
                                                .scheduleSelectedPos.value ==
                                            index
                                        ? getPrimaryDecoration()
                                        : BoxDecoration(
                                            borderRadius: getEdgyBorderRadius(),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.borderColor),
                                            color: ColorConstants.etBgColor),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        controller.scheduleSelectedPos.value ==
                                                index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.gretTextColor,
                                        FontWeight.w700),
                                  ),
                                  addText(
                                      ' : ',
                                      getSmallTextFontSIze(),
                                      controller.scheduleSelectedPos.value ==
                                              index
                                          ? ColorConstants.primaryColor
                                          : ColorConstants.gretTextColor,
                                      FontWeight.w700),
                                  Container(
                                    decoration: controller
                                                .scheduleSelectedPos.value ==
                                            index
                                        ? getPrimaryDecoration()
                                        : BoxDecoration(
                                            borderRadius: getEdgyBorderRadius(),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.borderColor),
                                            color: ColorConstants.etBgColor),
                                    padding: const EdgeInsets.all(5),
                                    child: addText(
                                        '05',
                                        getSmallTextFontSIze(),
                                        controller.scheduleSelectedPos.value ==
                                                index
                                            ? ColorConstants.primaryColor
                                            : ColorConstants.gretTextColor,
                                        FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget buildNewsItem(int index) {
    return FadeInRight(
      duration: Duration(milliseconds: 200 * (index + 1)),
      child: GestureDetector(
        onTap: () => Get.to(const NewsDetailScreen()),
        child: Container(
          width: 100.w,
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2),
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          decoration: BoxDecoration(
              color: index.isEven
                  ? const Color(0xffF5F5F5)
                  : ColorConstants.primaryColorLight,
              boxShadow: [getBoxShadow()],
              borderRadius: getCurvedBorderRadius()),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText(
                          'Principal’s Honouring Ceremony',
                          getSubheadingTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.w700),
                      SizedBox(
                        height: 2.h,
                      ),
                      addText(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam...',
                          getSmallTextFontSIze(),
                          ColorConstants.amberBlack.withOpacity(0.6),
                          FontWeight.normal),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          addText(
                              'School Admin',
                              getSmallTextFontSIze(),
                              ColorConstants.amberBlack.withOpacity(0.4),
                              FontWeight.normal),
                          const SizedBox(
                            width: 25,
                          ),
                          addText(
                              '15 mins ago',
                              getSmallTextFontSIze(),
                              ColorConstants.amberBlack.withOpacity(0.4),
                              FontWeight.normal),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
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
}
