import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/app/modules/schedule_meeting/dialogs/cancel_meeting_dialog.dart';
import 'package:stardriver/app/modules/schedule_meeting/dialogs/reschedule_meeting_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class PendingMeeting extends GetView<ScheduleMeetingController>{
  const PendingMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildComplainList(context),
      ),
    );
  }

  Widget buildComplainList(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            boxShadow: [getBoxShadow()],
            borderRadius: getBorderRadius(),
            color: ColorConstants.white,
          ),
          child: Column(
            children: [



              buildLongReason('fab_calendar', 'Schedule Date', '01/03/2023'),
              buildDivider(),
              buildLongReason('ic_time', 'Time Slot', '08:00 AM - 08:10 AM'),
              buildDivider(),
              buildLongReason('family', 'Meeting with', 'Mohammad Usman'),
              buildDivider(),
              buildLongReason('designation', 'Designation', 'Teacher Admin'),
              buildDivider(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/fab_calendar.svg',
                    height: getHeadingTextFontSIze(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  addText('Meeting type', getSmallTextFontSIze() + 1,
                      ColorConstants.black, FontWeight.normal),
                  addText(
                      ' : Audio Call',
                      getSmallTextFontSIze() + 1,
                      ColorConstants.primaryColor,
                      FontWeight.bold),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.messageView);
                    }, child: SvgPicture.asset('assets/images/ic_chat.svg'),
                  ),
                  const Spacer(),

                 GestureDetector(
                   onTap: (){
                     Get.toNamed(Routes.addTaskReminder);
                   },
                   child: Container(
                     decoration: BoxDecoration(
                         color: ColorConstants.primaryColorLight,
                         boxShadow: [getDeepBoxShadow()],
                         border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                         borderRadius: getBorderRadiusCircular()),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                       child: Center(
                         child: addText('Reminder', getSmallTextFontSIze(),
                             ColorConstants.primaryColor, FontWeight.w500),
                       ),
                     ),
                   ),
                 )

                ],
              ),

              buildDivider(),
              const SizedBox(height: 10,),

              SizedBox(
                height: 4.h,
                child: ListView.builder(
                  itemCount: controller.pendingList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() => GestureDetector (
                      onTap: (){
                        if(index == 0){
                          Get.dialog(RescheduleMeetingDialog(title: 'Reschedule',));
                        } else if(index == 1){
                          Get.dialog(const CancelMeetingDialog());
                        } else {
                          controller.selectedPendingPos.value = index;
                        }
                      },
                      child: Container(
                        height: 4.h,
                        width: 22.w,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: controller.selectedPendingPos.value == index ? getPrimaryDecoration() : getEditTextDecoration(),
                        child: Center(child: addText(controller.pendingList[index],getSmallTextFontSIze(), controller.selectedPendingPos.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.normal)),
                      ),
                    ));
                  },
                ),
              ),


              buildDivider(),
              StepProgressView(width: 100.w,
                  curStep: controller.curStep,
                  statuses: controller.heading,
                  color: ColorConstants.primaryColor,
                  titles: controller.dates),




            ],
          ),
        );
      },
    );
  }

  buildLongReason(String image,String title,String description){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/$image.svg',
          height: getHeadingTextFontSIze(),
        ),
        const SizedBox(
          width: 10,
        ),
        addText(title, getSmallTextFontSIze() + 1,
            ColorConstants.black, FontWeight.normal),
        Expanded(
          child: addText(
              ' : $description',
              getSmallTextFontSIze() + 1,
              ColorConstants.primaryColor,
              FontWeight.bold),
        ),
      ],
    );
  }

}