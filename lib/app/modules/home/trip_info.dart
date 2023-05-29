import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/home_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import '../../../index_to_position.dart';

class TripInfo extends GetView<HomeController> {
  const TripInfo({super.key, this.header});

  final String? header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: header ?? 'Trip Info',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
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
      onTap: () => Get.toNamed(Routes.tripDetailView),
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
                        addText(
                            '${indexToPosition(index + 1)} Pickup Trip',
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
                            margin: EdgeInsets.only(left: 8.w),
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
                                    header == 'This Week'
                                        ? 'START'
                                        : 'COMPLETED',
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
