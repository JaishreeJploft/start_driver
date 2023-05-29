import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/trip_history_record_controller.dart';
import 'package:stardriver/app/modules/trip_history_record/record_view.dart';
import 'package:stardriver/app/modules/trip_history_record/trip_history_record_view.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/sos_app_header.dart';
import 'package:stardriver/common/utils.dart';

class TripHistoryRecordBaseView extends GetView<TripHistoryRecordController> {
  const TripHistoryRecordBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Record',
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
      onTap: () => Get.to(const TripHistoryRecordView()),
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
                        addText('1st Pickup Trip', getSubheadingTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w700),
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
                                children: [
                                  addText(
                                      innerIndex == 0
                                          ? 'Start time'
                                          : "End time ",
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
