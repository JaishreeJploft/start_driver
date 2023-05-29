import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/app/modules/schedule_meeting/dialogs/cancel_meeting_dialog.dart';
import 'package:stardriver/app/modules/schedule_meeting/dialogs/reschedule_meeting_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/my_textform_field.dart';
import 'package:stardriver/common/utils.dart';

class CompletedMeeting extends GetView<ScheduleMeetingController>{
  const CompletedMeeting({super.key});

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
              // buildLongReason('designation', 'Meeting conclude' ,  'Concern Solved'),

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
                              text: "Meeting conclude: ".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getSmallTextFontSIze() + 1,
                                color: ColorConstants.black,
                                fontWeight: FontWeight.normal,
                              )),
                          TextSpan(
                            text: "Concern Solved.".tr,
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

              Obx(() => !controller.showFeedback.value ? Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: (){
                    showMeetingFeedbackDialogue(context);

                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        color: ColorConstants.primaryColorLight,
                        boxShadow: [getBoxShadow()],
                        border: Border.all(color: ColorConstants.primaryColor)
                    ), child: addAlignedText('ADD RATING', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                  ),
                ),
              ) : const SizedBox.shrink()),

              Obx(() => controller.showFeedback.value ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  addText('Feedback : ', getSmallTextFontSIze() + 1,
                      ColorConstants.black, FontWeight.normal),
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemSize: getLargeTextFontSIze(),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Image.asset('assets/images/star.png'),
                    onRatingUpdate: (rating) {
                      Get.log(rating.toString());
                    },
                  )
                ],
              ) : const SizedBox.shrink()),

              buildDivider(),

              StepProgressView(width: 100.w,
                  curStep: controller.curStep+2,
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

  showMeetingFeedbackDialogue(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                insetPadding: EdgeInsets.all(10),
                child: StatefulBuilder(builder: (context, setSta) {
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Align(alignment: AlignmentDirectional.topEnd,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,color: Colors.grey,),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                child: addAlignedText('Meeting Feedback', 18,
                                    Colors.black, FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(
                              CupertinoIcons.star_fill,
                              color: ColorConstants.primaryColor,
                              size: 16.sp,
                            ),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 2.h,),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextField(
                              controller: TextEditingController(),
                              hintText: "Add feedback...",
                              maxLine: 4,
                            )),
                        SizedBox(height: 1.h,),
                        GestureDetector(
                          onTap: (){
                            controller.showFeedback.value = true;
                            Navigator.pop(context);
                          },
                          child: BorderedButton(
                            text: 'SUBMIT',
                            width: 80,
                            ),
                        ),
                        SizedBox(height: 2.h,),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

}