import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/call_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AudioCallView extends GetView<CallController>{
  const AudioCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          IconButton(
            icon:  Icon(Icons.arrow_back, color: Colors.black,size: getLargeTextFontSIze() * 1.2,),
            onPressed: () => Navigator.of(context).pop(),
          ),


          Expanded(child: Center(
            child: Column(
              children: [
                SizedBox(height: 5.h,),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.primaryColor,),
                    borderRadius: getCurvedBorderRadius()
                  ), child: SvgPicture.asset('assets/images/ic_driver.svg',height: 10.h,),
                ),
                SizedBox(height: 2.h,),
                addText('Rahim Khan', getLargeTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                addText('Meeting Ends on 05:12', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),


              ],
            ),
          )),

          const Divider(
            height: 0,
            color: ColorConstants.primaryColor,
            thickness: 1,
          ),
          Container(
            height: 15.h,
            color: ColorConstants.primaryColorLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [



                GestureDetector(
                  onTap: (){
                    controller.isAudioCallOnSpeaker.value = !controller.isAudioCallOnSpeaker.value;
                  },
                  child: Obx(() => Container(
                    width: controller.buttonWidth,
                    height: controller.buttonWidth,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorConstants.primaryColor),
                        color: controller.isAudioCallOnSpeaker.value ? ColorConstants.primaryColorLight : ColorConstants.primaryColor
                    ),
                    child: SvgPicture.asset('assets/images/ic_speaker.svg',width: 8.w,color: !controller.isAudioCallOnSpeaker.value ? ColorConstants.primaryColorLight : ColorConstants.primaryColor,),
                  )),
                ),

                GestureDetector(
                  onTap: (){
                    controller.isAudioCallMuted.value = !controller.isAudioCallMuted.value;
                  },
                  child: Obx(() => Container(
                    width: controller.buttonWidth,
                    height: controller.buttonWidth,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorConstants.primaryColor),
                        color: controller.isAudioCallMuted.value ? ColorConstants.primaryColorLight : ColorConstants.primaryColor
                    ),
                    child: SvgPicture.asset('assets/images/ic_mute.svg',width: 8.w,color: !controller.isAudioCallMuted.value ? ColorConstants.primaryColorLight : ColorConstants.primaryColor,),
                  )),
                ),

                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    width: controller.buttonWidth,
                    height: controller.buttonWidth,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorConstants.primaryColor),
                        color: ColorConstants.primaryColor
                    ),
                    child: SvgPicture.asset('assets/images/ic_hung.svg',width: 8.w,color:  ColorConstants.primaryColorLight),
                  ),
                ),

              ],
            ),
          )

        ],
      )),
    );
  }

}