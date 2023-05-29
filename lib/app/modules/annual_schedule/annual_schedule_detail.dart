import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/scheduleController.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AnnualScheduleDetail extends GetView<ScheduleDetailController> {
  const AnnualScheduleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (date, events) {},
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,

      weekendTextStyle: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      daysTextStyle: TextStyle(
          color: ColorConstants.gretTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      markedDatesMap: controller.markedDateMap,
      height: 45.h,

      selectedDayButtonColor: Colors.transparent,
      selectedDayBorderColor: Colors.transparent,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),

      leftButtonIcon: Icon(
        Icons.arrow_back_ios,
        color: ColorConstants.primaryColor,
        size: getHeadingTextFontSIze(),
      ),
      rightButtonIcon: Icon(
        Icons.arrow_forward_ios,
        color: ColorConstants.primaryColor,
        size: getHeadingTextFontSIze(),
      ),
      // markedDateMoreCustomTextStyle: const TextStyle(color: ColorConstants.white),
      // markedDateMoreCustomDecoration: const BoxDecoration(color: ColorConstants.gretTextColor, shape: BoxShape.circle),
      // markedDateCustomShapeBorder: const CircleBorder(side: BorderSide(color: ColorConstants.blue,strokeAlign: StrokeAlign.inside)),
      markedDateCustomTextStyle: TextStyle(
          color: ColorConstants.lightTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      markedDateMoreShowTotal: true,
      showHeader: true,
      headerTextStyle: TextStyle(
          color: ColorConstants.black,
          fontWeight: FontWeight.bold,
          fontSize: getSubheadingTextFontSIze()),
      showHeaderButton: true,
      weekDayFormat: WeekdayFormat.narrow,
      todayTextStyle: TextStyle(
          color: ColorConstants.black,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      selectedDayTextStyle: TextStyle(
          color: ColorConstants.lightTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
      maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
          color: ColorConstants.lightGreyColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      nextDaysTextStyle: TextStyle(
          color: ColorConstants.lightTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      weekdayTextStyle: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      inactiveDaysTextStyle: TextStyle(
          color: ColorConstants.lightTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      onCalendarChanged: (DateTime date) {},
      onDayLongPressed: (DateTime date) {
        Get.log('long pressed date $date');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Annual Schedule',
          )),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color(0xFF0F8F8F8),
                borderRadius: getBorderRadius()),
            // child: _calendarCarouselNoHeader,
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    buildColors(ColorConstants.primaryColor, 'Holiday'),
                    SizedBox(
                      width: 6.w,
                    ),
                    buildColors(Color(0xff19AD54), 'Exams'),
                  ],
                ),
                calendarCarouselNoHeader
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
            decoration: BoxDecoration(
                color: ColorConstants.blue2,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/images/ic_winter.svg",
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText("Winter Vacations", getHeadingTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text("January 10 to February 10 ",
                          style: TextStyle(
                            fontFamily: 'Ariel',
                            fontSize: getNormalTextFontSIze(),
                            color: ColorConstants.black,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColors(Color color, String name) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(
          width: 3.w,
        ),
        addText(name, getSmallTextFontSIze(), ColorConstants.lightTextColor,
            FontWeight.normal)
      ],
    );
  }
}
