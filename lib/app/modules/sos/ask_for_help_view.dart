import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/sos_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AskForHelpView extends GetView<SOSController>{
  const AskForHelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  AppHeader(showBackIcon: true, title: 'Ask for Help')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            ListView.builder(
              itemCount: controller.askForHelpList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    controller.askForHelpSelectedPos.value = index;
                  },
                  child:  Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.primaryColor,width: 1),
                        borderRadius: getBorderRadius(),
                        color: ColorConstants.white ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText(controller.askForHelpList[index], getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.white,width: 2),
                              shape: BoxShape.circle,
                              boxShadow: [getDeepBoxShadow()],
                              color: controller.askForHelpSelectedPos.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor2
                          ), child: Icon(Icons.check,color: ColorConstants.white,size: getSubheadingTextFontSIze(),),
                        ),



                      ],
                    ),
                  )),
                );
              },
            ),
            SizedBox(height: 3.h,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: getEditTextDecoration(),
              child: buildLineEditText(controller.commentController!, 'Comment'),
            ),
            SizedBox(height: 2.h,),
            GestureDetector(
              onTap: (){},
              child: BorderedButton(width: 50.w, text: 'NOTIFY'),
            )


          ],
        ),
      ),
    );
  }
}