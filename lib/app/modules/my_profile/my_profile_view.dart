import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/my_profile_controller.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/account/account_view.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/details/profile_details.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/trips/profile_trips.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/base_tab_bar.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/print_qr_dialog.dart';
import 'package:stardriver/common/utils.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: false,
            title: 'My Profile',
          )),
      body: Obx(
        ()=> Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: getCurvedBorderRadius(),
            border: Border.all(color: ColorConstants.lightGreyColor),
            boxShadow: [getLightBoxShadow()],
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 8,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: getBorderRadius(),
                    border: Border.all(color: ColorConstants.primaryColor),
                    color: ColorConstants.primaryColorLight),
                child: ClipRRect(
                  borderRadius: getBorderRadius(),
                  child: const LinearProgressIndicator(
                    value: 0.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstants.primaryColor),
                    backgroundColor: ColorConstants.primaryColorLight,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Profile Complete 50%', getSmallTextFontSIze() - 1,
                      ColorConstants.primaryColor, FontWeight.w500),
                  addText(
                      'Complete Your Profile Till: 25 July, 2022',
                      getSmallTextFontSIze() - 1,
                      Colors.redAccent,
                      FontWeight.w500),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      border: Border.all(color: ColorConstants.primaryColor),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/ic_driver.svg',
                      height: getLargeTextFontSIze() * 2,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText(controller.userDetailsResponse.value.data?.name?? "N/A" , getHeadingTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.bold),

                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Designation ".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getNormalTextFontSIze(),
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.w500,
                                )),
                            TextSpan(
                              text: ': Driver',
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
                      // GestureDetector(
                      //   onTap: (){
                      //     Get.toNamed(Routes.deactivationDetails);
                      //   }, child: Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                      //   decoration: BoxDecoration(
                      //       borderRadius: getCurvedBorderRadius(),
                      //       border: Border.all(color: ColorConstants.primaryColor),
                      //       color: ColorConstants.primaryColorLight),
                      //   child: addText('DEACTIVATED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                      // ),
                      // ),
                      // SizedBox(height: 1.h,),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center(
                              child: Container(
                                width: 100.w,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: getCurvedBorderRadius(),
                                    border: Border.all(
                                        color: ColorConstants.borderColor),
                                    color: ColorConstants.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        addText(
                                            'Qr Code',
                                            getSubheadingTextFontSIze(),
                                            ColorConstants.black,
                                            FontWeight.bold),
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
                                    SvgPicture.asset(
                                      'assets/images/qrcode.svg',
                                      width: 60.w,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                        child: SvgPicture.asset('assets/images/qrcode.svg'),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const PrintQrDialog());
                      },
                      child: CircularBorderedButton(
                        width: 100.w,
                        text: 'Print QR'.toUpperCase(),
                        horizontalPadding: 5.4.w,
                        capFirst: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: () {
                        showProgramNFCDialogue(context);
                      },
                      child: CircularBorderedButton(
                        width: 100.w,
                        text: 'PROGRAMME NFC',
                        horizontalPadding: 7.w,
                        capFirst: false,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              BaseTabBar(tabController: controller.controller, tabList: [
                Tab(
                  text: 'Account'.tr,
                ),
                Tab(
                  text: 'Details'.tr,
                ),
                Tab(
                  text: 'School'.tr,
                ),
              ]),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.controller,
                  children: const [
                    AccountView(),
                    ProfileDetails(),
                    ProfileTrips()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
