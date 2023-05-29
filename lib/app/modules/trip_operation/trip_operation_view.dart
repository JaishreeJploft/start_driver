import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/remaining_controller.dart';
import 'package:stardriver/app/controller/trip_operation_controller.dart';
import 'package:stardriver/app/modules/trip_operation/sub_pages/absent.dart';
import 'package:stardriver/app/modules/trip_operation/sub_pages/late.dart';
import 'package:stardriver/app/modules/trip_operation/sub_pages/onboard.dart';
import 'package:stardriver/app/modules/trip_operation/sub_pages/remaining.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/sos_app_header.dart';
import 'package:stardriver/common/utils.dart';

import '../../../index_to_position.dart';

class TripOperationView extends GetView<TripOperationController> {
  const TripOperationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TripOperationController());
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Trips',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          buildTabs(),
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

  Widget buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          // color: const Color(0xFFEEEEEE),
          borderRadius: getBorderRadius()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(() => GestureDetector(
                  onTap: () {
                    controller.calendarSelectedPos.value = 1;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: controller.calendarSelectedPos.value == 1
                        ? getPrimaryDecoration2()
                        : getEditTextDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: addText(
                            'Pickup',
                            getSubheadingTextFontSIze(),
                            controller.calendarSelectedPos.value == 1
                                ? ColorConstants.primaryColor
                                : ColorConstants.borderColor,
                            FontWeight.w500),
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Obx(() => GestureDetector(
                  onTap: () {
                    controller.calendarSelectedPos.value = 2;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: controller.calendarSelectedPos.value == 2
                        ? getPrimaryDecoration2()
                        : getEditTextDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: addText(
                            'Drop Off',
                            getSubheadingTextFontSIze(),
                            controller.calendarSelectedPos.value == 2
                                ? ColorConstants.primaryColor
                                : ColorConstants.borderColor,
                            FontWeight.w500),
                      ),
                    ),
                  ),
                )),
          ),
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
      onTap: () => Get.to(const TripOperationView2()),
      child: Container(
        width: 100.w,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
            color: ColorConstants.white,
            boxShadow: [getDeepBoxShadow()],
            border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
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
                        Obx(() => addText(
                            controller.calendarSelectedPos.value == 1
                                ? '${indexToPosition(index + 1)} Pickup Trip'
                                : '${indexToPosition(index + 1)} Drop Off Trip',
                            getSubheadingTextFontSIze(),
                            ColorConstants.primaryColor,
                            FontWeight.w700)),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/route.svg',
                                color: ColorConstants.primaryColor),
                            const SizedBox(
                              width: 7,
                            ),
                            addText('Route 1', getNormalTextFontSIze(),
                                ColorConstants.primaryColor, FontWeight.w700),
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
                            addText('Passenger : 30', getNormalTextFontSIze(),
                                ColorConstants.primaryColor, FontWeight.w700),
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
                                width: 8,
                              ),
                              addText('Stops : 12', getNormalTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w700),
                            ],
                          ),
                        ),
                        buildDivider(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.tripRouteView);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/passengers.svg',
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
                      ],
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, innerIndex) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  addText(
                                      innerIndex == 0
                                          ? 'Start time'
                                          : "End time",
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
                                        innerIndex == 0 ? '05' : '12',
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
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/images/fab_calendar.svg',
                              color: ColorConstants.primaryColor,
                              height: getNormalTextFontSIze(),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            addText('07/07/2023', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.normal)
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(left: 7.w),
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
                                    'COMPLETED',
                                    getSmallTextFontSIze(),
                                    ColorConstants.primaryColor,
                                    FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class TripOperationView2 extends GetView<TripOperationController> {
  const TripOperationView2({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TripOperationController());
    Get.put(RemainingController());

    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: SOSAppHeader(
            showBackIcon: true,
            title: 'Trip Operation',
          )),
      body: FadeInRight(
        child: Column(
          children: [
            Container(
              width: 100.w,
              margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
              decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [getDeepBoxShadow()],
                  border: Border.all(
                      color: ColorConstants.primaryColor, width: 1.5),
                  borderRadius: getCurvedBorderRadius()),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
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
                              addText('Route 1', getNormalTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w700),
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
                              addText('Passenger : 30', getNormalTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w700),
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
                            onTap: () {
                              Get.toNamed(Routes.tripRouteView);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/passengers.svg',
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
                        ],
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, innerIndex) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    addText(
                                        innerIndex == 0
                                            ? 'Start time'
                                            : "End time",
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
                                          innerIndex == 0 ? '05' : '12',
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
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                'assets/images/fab_calendar.svg',
                                color: ColorConstants.primaryColor,
                                height: getNormalTextFontSIze(),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              addText('07/07/2023', getSmallTextFontSIze(),
                                  ColorConstants.black, FontWeight.normal)
                            ],
                          ),
                        ],
                      ))
                    ],
                  )),
            ),
            buildTabs(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                physics: const NeverScrollableScrollPhysics(),
                children: const [Remaining(), Onboard(), Late(), Absent()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabs() {
    return SizedBox(
      height: 5.h,
      child: ListView.builder(
        itemCount: controller.tabListItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              controller.selectedTabPosition.value = index;
              controller.controller.index = index;
            },
            child: Obx(
              () => Container(
                width: 22.w,
                margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                // padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    color: controller.selectedTabPosition.value == index
                        ? ColorConstants.primaryColorLight
                        : ColorConstants.white,
                    boxShadow: [getBoxShadow()],
                    borderRadius: getBorderRadius()),
                child: Center(
                    child: addText(
                        controller.tabListItems[index].toUpperCase(),
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
