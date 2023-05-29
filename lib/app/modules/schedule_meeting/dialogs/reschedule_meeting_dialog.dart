import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class RescheduleMeetingDialog extends GetView<ScheduleMeetingController>{
   RescheduleMeetingDialog({super.key,required this.title});

   String title;


  @override
  Widget build(BuildContext context) {

    final calendarCarouselNoHeader = Obx(() => CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        controller.setRescheduleDate(date);
      },
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
      height: 40.h,

      selectedDayButtonColor: ColorConstants.primaryColorLight,
      selectedDayBorderColor: ColorConstants.primaryColor,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),

      leftButtonIcon:  Icon(Icons.arrow_back_ios,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
      rightButtonIcon:  Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
      markedDateCustomTextStyle: TextStyle(
          color: ColorConstants.lightTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      selectedDateTime: controller.rescheduleDate.value,
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
          color: ColorConstants.primaryColor,
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
          color:ColorConstants.lightTextColor,
          fontWeight: FontWeight.normal,
          fontSize: getNormalTextFontSIze()),
      onCalendarChanged: (DateTime date) {
      },
      onDayLongPressed: (DateTime date) {
        Get.log('long pressed date $date');
      },
    ));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10,),
                    addText(title, getSubheadingTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
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
                calendarCarouselNoHeader,
                addText('Select Time Slot', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                SizedBox(
                  height: 2.h,
                ),
                ListView.builder(
                  itemCount: controller.rescheduleDateTimeList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        controller.selectedRescheduleDatePos.value = index;
                      },
                      child:  Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                        margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.primaryColor,width: 1),
                            borderRadius: getBorderRadius(),
                            color:  ColorConstants.white),
                        child: Stack(

                          children: [




                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Obx(() => Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorConstants.white,width: 0),
                                    shape: BoxShape.circle,
                                    boxShadow: [getDeepBoxShadow()],
                                    color: controller.selectedRescheduleDatePos.value == index? ColorConstants.primaryColor : ColorConstants.borderColor2
                                ), child: controller.selectedRescheduleDatePos.value == index ? Icon(Icons.check,color: ColorConstants.white,size: getSubheadingTextFontSIze(),) : const SizedBox.shrink(),
                              )),
                            ),

                            Center(child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                                child: addText(controller.rescheduleDateTimeList[index], getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w500))),




                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}