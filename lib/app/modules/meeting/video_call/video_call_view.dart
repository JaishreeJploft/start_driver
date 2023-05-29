import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/call_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class VideoCallView extends GetView<CallController> {
  const VideoCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: getLargeTextFontSIze() * 1.2,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              addText('Rahim Khan', getHeadingTextFontSIze() + 2,
                  ColorConstants.primaryColor, FontWeight.bold),
              SizedBox(
                width: getLargeTextFontSIze() * 2,
              )
            ],
          ),
          Expanded(
              child: Container(
            width: 100.w,
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor)),
            child: Stack(
              children: [
                Center(
                    child: SvgPicture.asset(
                  'assets/images/ic_nurse.svg',
                  width: 50.w,
                )),
                Positioned(
                  bottom: 3.h,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.primaryColor,
                        ),
                        borderRadius: getCurvedBorderRadius()),
                    child: SvgPicture.asset(
                      'assets/images/ic_driver.svg',
                      height: 10.h,
                    ),
                  ),
                ),
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
                  onTap: () {
                    controller.isVideoCallOnSpeaker.value =
                        !controller.isVideoCallOnSpeaker.value;
                  },
                  child: Obx(() => Container(
                        width: controller.buttonWidth,
                        height: controller.buttonWidth,
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            color: controller.isVideoCallOnSpeaker.value
                                ? ColorConstants.primaryColorLight
                                : ColorConstants.primaryColor),
                        child: SvgPicture.asset(
                          'assets/images/ic_speaker.svg',
                          width: 8.w,
                          color: !controller.isVideoCallOnSpeaker.value
                              ? ColorConstants.primaryColorLight
                              : ColorConstants.primaryColor,
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.isVideoCallMuted.value =
                        !controller.isVideoCallMuted.value;
                  },
                  child: Obx(() => Container(
                        width: controller.buttonWidth,
                        height: controller.buttonWidth,
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            color: controller.isVideoCallMuted.value
                                ? ColorConstants.primaryColorLight
                                : ColorConstants.primaryColor),
                        child: SvgPicture.asset(
                          'assets/images/ic_mute.svg',
                          width: 8.w,
                          color: !controller.isVideoCallMuted.value
                              ? ColorConstants.primaryColorLight
                              : ColorConstants.primaryColor,
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.isVideoEnabled.value =
                        !controller.isVideoEnabled.value;
                  },
                  child: Obx(() => Container(
                        width: controller.buttonWidth,
                        height: controller.buttonWidth,
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            color: controller.isVideoEnabled.value
                                ? ColorConstants.primaryColorLight
                                : ColorConstants.primaryColor),
                        child: SvgPicture.asset(
                          'assets/images/ic_show_video.svg',
                          width: 8.w,
                          color: !controller.isVideoEnabled.value
                              ? ColorConstants.primaryColorLight
                              : ColorConstants.primaryColor,
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: controller.buttonWidth,
                    height: controller.buttonWidth,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorConstants.primaryColor),
                        color: ColorConstants.primaryColor),
                    child: SvgPicture.asset('assets/images/ic_hung.svg',
                        width: 8.w, color: ColorConstants.primaryColorLight),
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
