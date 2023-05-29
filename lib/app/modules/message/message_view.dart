import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/message_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          Container(
            color: ColorConstants.primaryColorLight,
            padding:
                const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 5),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/ic_back.svg",
                        height: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorConstants.primaryColor),
                          borderRadius: getCurvedBorderRadius(),
                          color: ColorConstants.white),
                      child: SvgPicture.asset(
                        'assets/images/ic_driver.svg',
                        width: 12.w,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText('Rafiq', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.bold),
                        addText('Security Admin', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.bold),
                      ],
                    )),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.toNamed(Routes.scheduleMeeting);
                    //   },
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [

                    //       SvgPicture.asset(
                    //         'assets/images/ic_meeting.svg',
                    //         height: getLargeTextFontSIze(),
                    //       ),
                    //       addAlignedText(
                    //           'Schedule\nMeeting',
                    //           getSmallestTextFontSIze(),
                    //           ColorConstants.primaryColor,
                    //           FontWeight.bold)
                    //     ],
                    //   ),
                    // ),

                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.scheduleMeeting);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_translate.svg',
                            height: getLargeTextFontSIze() * 1.2,
                          ),
                          addAlignedText('\n', getSmallestTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold)
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.toNamed(Routes.videoCall);
                    //   },
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       SvgPicture.asset(
                    //         'assets/images/video_call.svg',
                    //         height: getLargeTextFontSIze() * 1.2,
                    //       ),
                    //       addAlignedText('\n', getSmallestTextFontSIze(),
                    //           ColorConstants.primaryColor, FontWeight.bold)
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.audioCall);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/audio_call.svg',
                            height: getLargeTextFontSIze(),
                          ),
                          addAlignedText('\n', getSmallestTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          ),
          const Divider(
            color: ColorConstants.primaryColor,
            height: 0,
            thickness: 1,
          ),
          Expanded(child: buildChatList()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80.w,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorConstants.lightGreyColor, width: 0.5),
                      color: ColorConstants.etBgColor,
                      borderRadius: getBorderRadiusCircular()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_smile.svg',

                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        maxLines: 100,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        controller: controller.chatController,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: getNormalTextFontSIze()),
                        decoration: InputDecoration(
                            hintText: 'Message'.tr,
                            hintStyle: TextStyle(
                                fontSize: getNormalTextFontSIze(),
                                color: ColorConstants.gretTextColor
                                    .withOpacity(0.8)),
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            // contentPadding: EdgeInsets.zero,
                            border: InputBorder.none),
                      )),
                      SvgPicture.asset(
                        'assets/images/ic_attachment.svg',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/images/ic_audio_file.svg',
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // if (controller.chatController.text.trim().isNotEmpty) {
                    //   controller.sendMessage(controller.vendorId, controller.chatController.text.trim());
                    // }
                  },
                  child: SvgPicture.asset(
                    'assets/images/send.svg',
                    width: 10.w,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget buildChatList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        reverse: true,
        itemCount: controller.messages.length,
        // controller: controller.scrollController,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment:
                      controller.messages[index].messageType == "receiver"
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment:
                          controller.messages[index].messageType == "receiver"
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            boxShadow: [getDeepBoxShadow()],
                            color: (controller.messages[index].messageType ==
                                    "receiver"
                                ? ColorConstants.white
                                : ColorConstants.primaryColorLight),
                            borderRadius:
                                controller.messages[index].messageType ==
                                        "receiver"
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )
                                    : const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            controller.messages[index].messageContent,
                            style: TextStyle(fontSize: getNormalTextFontSIze()),
                          ),
                        ),
                        const Text(
                          "5:00 AM",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
