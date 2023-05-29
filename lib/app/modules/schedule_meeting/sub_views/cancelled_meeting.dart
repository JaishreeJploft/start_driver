import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class CancelledMeeting extends GetView<ScheduleMeetingController>{
  const CancelledMeeting({super.key});

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


                ],
              ),
              buildDivider(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/designation.svg',
                    height: getHeadingTextFontSIze(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Reason: ".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getSmallTextFontSIze() + 1,
                                color: ColorConstants.black,
                                fontWeight: FontWeight.normal,
                              )),
                          TextSpan(
                            text: "This concern can be solved VIA chat, therefore, an appointment is not needed.".tr,
                            style: TextStyle(
                              fontFamily: 'Ariel',
                              fontSize: getSmallTextFontSIze() + 1,
                              color: ColorConstants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(child: SvgPicture.asset('assets/images/ic_edit.svg'))
                        ],
                      ),
                    ),
                  ),





                ],
              ),




              buildDivider(),

              StepProgressView(width: 100.w,
                  curStep: controller.curStep,
                  statuses: const [
                    'Request\nRaised',
                    'Request\nCancelled',
                  ],
                  color: ColorConstants.primaryColor,
                  titles: const ['July 2','July 5']),




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