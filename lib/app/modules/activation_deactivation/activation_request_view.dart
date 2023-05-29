import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/activation_controller.dart';
import 'package:stardriver/app/modules/activation_deactivation/activation_sub_view.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/base_tab_bar.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ActivationRequestView extends GetView<ActivationController>{
  const ActivationRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Activation Request',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  boxShadow: [getBoxShadow()],
                  color: ColorConstants.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                            borderRadius: getCurvedBorderRadius(),
                            border: Border.all(color: ColorConstants.primaryColor),
                          ),
                          child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*2,),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            addText('Rafiq Khan', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                            SizedBox(
                                width: 30.w,
                                child: Divider(
                                  color: ColorConstants.primaryColor.withOpacity(0.1),
                                  thickness: 2,
                                  height: 5,
                                )),
                            addText('#546938', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                            SizedBox(
                                width: 30.w,
                                child: Divider(
                                  color: ColorConstants.primaryColor.withOpacity(0.1),
                                  thickness: 2,
                                  height: 5,
                                )),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Blood Type".tr,
                                      style: TextStyle(
                                        fontFamily: 'Ariel',
                                        fontSize: getNormalTextFontSIze(),
                                        color: ColorConstants.black,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextSpan(
                                    text: ": A+".tr,
                                    style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getNormalTextFontSIze(),
                                      color: ColorConstants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [

                            GestureDetector(
                              onTap: (){

                              }, child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: getCurvedBorderRadius(),
                                  border: Border.all(color: ColorConstants.primaryColor),
                                  color: ColorConstants.primaryColorLight),
                              child: addText('DEACTIVATED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                            ),
                            ),
                            SizedBox(height: 1.h,),
                            GestureDetector(
                              onTap: (){
                                Get.dialog(Scaffold(
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
                                              addText('Qr Code', getSubheadingTextFontSIze(),
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
                                          SvgPicture.asset('assets/images/qrcode.svg',width: 60.w,),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              }, child: SvgPicture.asset('assets/images/qrcode.svg'),
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems('Deactivation Date', '12-07-2022'),
                      verticalDivider(),
                      buildInfoItems('Time', '9:30 am'),
                    ],
                  ),
                  SizedBox(height: 1.h,)
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            BaseTabBar(tabController: controller.controller,tabList: [
              Tab(
                text: 'Pending'.tr,
              ),
              Tab(
                text: 'Completed'.tr,
              ),
            ]),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                children: const [
                  ActivationSubView(),
                  ActivationSubView(),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}