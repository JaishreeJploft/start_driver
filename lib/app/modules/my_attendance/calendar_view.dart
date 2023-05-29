import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/attendance_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/show_qr_widget.dart';
import 'package:stardriver/common/utils.dart';

class CalendarView extends GetView<AttendanceController> {
  const CalendarView({super.key});

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
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Calendar',
          )),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: getCurvedBorderRadius(),
                border: Border.all(color: ColorConstants.borderColor2)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    border: Border.all(color: ColorConstants.primaryColor),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/ic_driver.svg',
                    height: getLargeTextFontSIze() * 2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText('Nawaz Alam', getNormalTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const SizedBox(
                      height: 2,
                    ),
                    addText('#632541', getNormalTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                    const SizedBox(
                      height: 2,
                    ),
                    addText('Driver', getNormalTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                  ],
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      showQrDialog();
                    },
                    child: SvgPicture.asset('assets/images/qrcode.svg'))
              ],
            ),
          ),
          buildTabs(),
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
                    buildColors(ColorConstants.lightTextColor, 'Absent'),
                    SizedBox(
                      width: 6.w,
                    ),
                    buildColors(ColorConstants.blue, 'Late'),
                    SizedBox(
                      width: 6.w,
                    ),
                    buildColors(ColorConstants.primaryColor, 'Holiday'),
                  ],
                ),
                calendarCarouselNoHeader
              ],
            ),
          ),
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
          Obx(() => GestureDetector(
                onTap: () {
                  controller.calendarSelectedPos.value = 1;
                },
                child: Container(
                  width: 28.w,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: controller.calendarSelectedPos.value == 1
                      ? getPrimaryDecoration2()
                      : getEditTextDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: addText(
                          'Present',
                          getSubheadingTextFontSIze(),
                          controller.calendarSelectedPos.value == 1
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor,
                          FontWeight.w500),
                    ),
                  ),
                ),
              )),
          Obx(() => GestureDetector(
                onTap: () {
                  controller.calendarSelectedPos.value = 2;
                },
                child: Container(
                  width: 28.w,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: controller.calendarSelectedPos.value == 2
                      ? getPrimaryDecoration2()
                      : getEditTextDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: addText(
                          'Absent',
                          getSubheadingTextFontSIze(),
                          controller.calendarSelectedPos.value == 2
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor,
                          FontWeight.w500),
                    ),
                  ),
                ),
              )),
          Obx(() => GestureDetector(
                onTap: () {
                  controller.calendarSelectedPos.value = 3;
                },
                child: Container(
                  width: 28.w,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: controller.calendarSelectedPos.value == 3
                      ? getPrimaryDecoration2()
                      : getEditTextDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: addText(
                          'Late',
                          getSubheadingTextFontSIze(),
                          controller.calendarSelectedPos.value == 3
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor,
                          FontWeight.w500),
                    ),
                  ),
                ),
              )),
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
