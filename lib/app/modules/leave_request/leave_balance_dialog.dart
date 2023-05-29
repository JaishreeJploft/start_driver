import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/leave_request_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class LeaveBalanceDialog extends GetView<LeaveRequestController>{
  const LeaveBalanceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                  addText('Leave Balance', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Flexible(flex: 2, child: addText(controller.leaveTypeList[index], getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),),
                  SizedBox(
                    width: 30.w,
                    child: addText('Leave Types', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  ),
                  addText('Allocated ', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  addText('Balance', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  const SizedBox()

                ],
              ),

              buildDivider(),
              ListView.builder(
                itemCount: controller.leaveTypeList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // Flexible(flex: 2, child: addText(controller.leaveTypeList[index], getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),),
                          SizedBox(
                            width: 30.w,
                            child: Row(
                              children: [
                                Expanded(child: addText(controller.leaveTypeList[index], getSmallTextFontSIze()+1, ColorConstants.black, FontWeight.normal)),
                                Tooltip(
                                  decoration: BoxDecoration(
                                      color: ColorConstants.white,
                                      boxShadow: [getDeepBoxShadow()],
                                      borderRadius: getBorderRadius()
                                  ),
                                  padding: EdgeInsets.all(20),
                                  richMessage: TextSpan(

                                    children: [
                                      TextSpan(
                                          text: "Evidence Required for the Approval\n\n".tr,
                                          style: TextStyle(
                                            fontFamily: 'Ariel',
                                            fontSize: getNormalTextFontSIze(),
                                            color: ColorConstants.black,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      TextSpan(
                                        text: "Medical Certificate\nHealth Condition Certificate".tr,
                                        style: TextStyle(
                                          fontFamily: 'Ariel',
                                          fontSize: getNormalTextFontSIze(),
                                          color: ColorConstants.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: SvgPicture.asset('assets/images/ic_info.svg',height: getNormalTextFontSIze(),),
                                )

                              ],
                            ),
                          ),
                          addText('2', getSmallTextFontSIze()+1, ColorConstants.black, FontWeight.normal),
                          addText('8', getSmallTextFontSIze()+1, ColorConstants.black, FontWeight.normal),
                          const SizedBox()

                        ],
                      ),
                      buildDivider()
                    ],
                  );
                },
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: ColorConstants.borderColor2.withOpacity(0.5),
      thickness: 1,
      height: 2.h,
    );
  }

}