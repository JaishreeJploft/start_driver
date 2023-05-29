import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/chat_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class GroupChats extends GetView<ChatController> {
  String? role;
  GroupChats({super.key,this.role});



  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> staffGroupDetails = role=="parent"? [
      {
        "name": "Parents Group",
      },
      {
        "name": "Parents Group",
      }
    ]:[
      {
        "name": "Driver Group",
      },
      {
        "name": "Supervisor Group",
      }
    ];

    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: getCurvedBorderRadius(),
                color: ColorConstants.white,
                boxShadow: [getBoxShadow()]),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      color: ColorConstants.white,
                      border: Border.all(color: ColorConstants.primaryColor)),
                  child: SvgPicture.asset(
                    'assets/images/ic_group.svg',
                    height: 7.h,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText(staffGroupDetails[index]["name"], getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.w500),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      addText(
                          'Message : Can You Please',
                          getSmallTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.normal),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed(Routes.scheduleMeeting);
                //   },
                //   child: Column(
                //     children: [
                //       SvgPicture.asset(
                //         'assets/images/ic_schedule.svg',
                //         height: getLargeTextFontSIze(),
                //       ),
                //       addAlignedText(
                //           'Schedule Meeting \n',
                //           getSmallestTextFontSIze(),
                //           ColorConstants.black,
                //           FontWeight.normal)
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.messageView);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_chat.svg',
                          height: getLargeTextFontSIze(),
                        ),
                        addAlignedText('Chats\n', getSmallestTextFontSIze(),
                            ColorConstants.black, FontWeight.normal)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
