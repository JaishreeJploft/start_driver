import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/notification_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class NotificationView extends GetView<NotificationController>{
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            notificationIcon:false,
            title: 'Notifications',
          )),
      body: SizedBox(
        width: 100.w,
        height: 100.w,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return buildNotificationItem(index);
          },
        ),
      ),
    );
  }
  
  Widget buildNotificationItem(int index){
    return FadeInRight(
      duration: Duration(milliseconds: 200*(index+1)),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.primaryColor),
              borderRadius: getCurvedBorderRadius(),
            ),
            child: SvgPicture.asset('assets/images/ic_driver.svg',height: 4.h,),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addText('Ahmed', getNormalTextFontSIze(), ColorConstants.black, FontWeight.w500),
              addText('Lorem Ipsum is simply dummy',
                  getSmallTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
            ],
          )),
          addText('7:30 pm  - 05/05/2022', getSmallestTextFontSIze(), ColorConstants.lightTextColor, FontWeight.w500),
          const SizedBox(width: 10,),


        ],
      ),
    );
  }

}