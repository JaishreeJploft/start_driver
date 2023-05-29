import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/chat_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ChatAdminView extends GetView<ChatController>{
  const ChatAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              color: ColorConstants.white,
              boxShadow: [getBoxShadow()]
            ), child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    color: ColorConstants.white,
                    border: Border.all(color: ColorConstants.primaryColor)
                ), child: SvgPicture.asset('assets/images/user.svg',height: 7.h,),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  addText('Rehan', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w500),
                  SizedBox(height: 0.5.h,),
                  addText('School Admin', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                  SizedBox(height: 0.5.h,),
                  addText('(Dubai Public School)', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),

                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.scheduleMeeting);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/ic_meeting.svg',height: getLargeTextFontSIze(),),
                    addAlignedText('Schedule\nMeeting', getSmallestTextFontSIze(), ColorConstants.black, FontWeight.normal)
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.messageView);
                },
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.messageView);
                      },
                      child: SvgPicture.asset('assets/images/ic_chat.svg',height: getLargeTextFontSIze(),),
                    ),
                    addAlignedText('Chats\n', getSmallestTextFontSIze(), ColorConstants.black, FontWeight.normal)


                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          );
        },
      ),
    );
  }

}