import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/awareness.dart';
import 'package:stardriver/app/modules/assignments/worksheet.dart';
import 'package:stardriver/app/modules/assignments/worksheet_view.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/delete_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';
import '../app/controller/home_controller.dart';
import '../app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import '../app/routes/app_routes.dart';
import 'logoutDialog.dart';

class AppDrawer extends GetView<HomeController> {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColorLight,
      width: 80.w,
      height: 100.h,
      child: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SvgPicture.asset(
                    'assets/images/app_logo2.svg',
                    height: 6.h,
                  ),
                ),
              ),
              Divider(
                height: 4.h,
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    initiallyExpanded: false,
                    childrenPadding: EdgeInsets.zero,
                    iconColor: ColorConstants.primaryColor,
                    collapsedIconColor: ColorConstants.primaryColor,
                    title: addText('My Profile', 20.sp,
                        ColorConstants.primaryColor, FontWeight.normal),
                    backgroundColor: ColorConstants.primaryColorLight,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.find<BaseController>().bottomNavigationKey.currentState?.setPage(4);
                          Get.back();
                          Get.toNamed(Routes.editProfileView);
                        },
                        child: buildItems('Profile'),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.walletView,
                              arguments: {'heading': 'Wallet'});
                        },
                        child: buildItems('Wallet'),
                      ),

                      // GestureDetector(
                      //   onTap: (){
                      //     Get.back();
                      //     // Get.find<BaseController>().bottomNavigationKey.currentState!.setPage(0);
                      //     Get.find<BaseController>().bottomNavigationKey.currentState?.setPage(4);
                      //     // Get.find<MyProfileController>().controller.index = 2;
                      //   },
                      //   child: buildItems('Trips'),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.tripView);
                        },
                        child: buildItems('Trips'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.attendanceView);
                        },
                        child: buildItems('Attendance'),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.performanceView);
                        },
                        child: buildItems('Performance'),
                      ),
                    ]),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    initiallyExpanded: false,
                    childrenPadding: EdgeInsets.zero,
                    iconColor: ColorConstants.primaryColor,
                    collapsedIconColor: ColorConstants.primaryColor,
                    title: addText('Assignments', 20.sp,
                        ColorConstants.primaryColor, FontWeight.normal),
                    backgroundColor: ColorConstants.primaryColorLight,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.find<BaseController>().bottomNavigationKey.currentState?.setPage(4);
                          Get.back();
                          // Get.toNamed(Routes.workSheetView);
                          Get.to(() => Awareness());
                        },
                        child: buildItems('Awareness & Courses'),
                      ),

                      GestureDetector(
                        onTap: () {
                          // Get.find<BaseController>().bottomNavigationKey.currentState?.setPage(4);
                          Get.back();
                          Get.to(() => MyWorkSheetView());

                          // Get.toNamed(Routes.workSheetView);
                          // Get.to(() => MyWorkSheetView());
                        },
                        child: buildItems('Worksheet'),
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     Get.back();
                      //     Get.toNamed(Routes.walletView,
                      //         arguments: {'heading': 'Wallet'});
                      //   },
                      //   child: buildItems('Courses'),
                      // ),

                      // GestureDetector(
                      //   onTap: (){
                      //     Get.back();
                      //     // Get.find<BaseController>().bottomNavigationKey.currentState!.setPage(0);
                      //     Get.find<BaseController>().bottomNavigationKey.currentState?.setPage(4);
                      //     // Get.find<MyProfileController>().controller.index = 2;
                      //   },
                      //   child: buildItems('Trips'),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.back();
                      //     Get.toNamed(Routes.tripView);
                      //   },
                      //   child: buildItems('Trips'),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.back();
                      //     Get.toNamed(Routes.attendanceView);
                      //   },
                      //   child: buildItems('Attendance'),
                      // ),
                      //
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.back();
                      //     Get.toNamed(Routes.performanceView);
                      //   },
                      //   child: buildItems('Performance'),
                      // ),
                    ]),
              ),
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.tripHistoryRecord);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Trip History Record', 20.sp,
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.busDetailView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Bus Details', 20.sp, ColorConstants.primaryColor,
                        FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.myRouteView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Route', 20.sp, ColorConstants.primaryColor,
                        FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 3.h,
              ),
              // GestureDetector(
              //   onTap: (){
              //     Get.back();
              //     Get.toNamed(Routes.shop);
              //   },
              //   child: Row(
              //     children: [
              //       const SizedBox(width: 15,),
              //       addText('Shop', 20.sp, ColorConstants.primaryColor, FontWeight.normal),
              //       const Spacer(),
              //       Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
              //       const SizedBox(width: 20,),

              //     ],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.shop);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Shop', 20.sp, ColorConstants.primaryColor,
                        FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.taskReminderView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Tasks & Reminders', 20.sp,
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.complainView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Complaints & Reports', 20.sp,
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.feedbackView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Help & Feedback', 20.sp,
                        ColorConstants.primaryColor, FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              //   GestureDetector(
              //     onTap: () {
              //       Get.back();
              //       Get.toNamed(Routes.walletView,
              //           arguments: {'heading': 'Transactions Record'});
              //     },
              //     child: Row(
              //       children: [
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         addText('Transactions Record', 20.sp,
              //             ColorConstants.primaryColor, FontWeight.normal),
              //         const Spacer(),
              //         Icon(
              //           Icons.arrow_forward_ios,
              //           color: ColorConstants.primaryColor,
              //           size: getHeadingTextFontSIze(),
              //         ),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //       ],
              //     ),
              //   ),
              //   SizedBox(
              //     height: 3.h,
              //   ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.eventsView);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Events', 20.sp, ColorConstants.primaryColor,
                        FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  // Get.dialog(Scaffold(
                  //   backgroundColor: ColorConstants.white,
                  //   appBar: PreferredSize(
                  //       preferredSize: Size.fromHeight(7.h),
                  //       child: AppHeader(
                  //         showBackIcon: true,
                  //         title: 'About App',
                  //       )),
                  //   body: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: Column(
                  //       children: [
                  //         addText(
                  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  //             getNormalTextFontSIze(),
                  //             ColorConstants.black,
                  //             FontWeight.normal)
                  //       ],
                  //     ),
                  //   ),
                  // ));
                  Get.back();
                  Get.toNamed(Routes.aboutApp);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('About App', 20.sp, ColorConstants.primaryColor,
                        FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(const LogoutDialog(message: 'Are you sure you want to logout?'));
                  // Get.back();
                  // Get.toNamed(Routes.aboutApp);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    addText('Logout', 20.sp, ColorConstants.primaryColor,
                        FontWeight.normal),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstants.primaryColor,
                      size: getHeadingTextFontSIze(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close,
                  color: ColorConstants.primaryColor,
                  size: getLargeTextFontSIze() * 1.2,
                ),
              ))
        ],
      )),
    );
  }

  Widget buildItems(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              addText(title, getSubheadingTextFontSIze(),
                  ColorConstants.primaryColor, FontWeight.normal),
              SvgPicture.asset(
                'assets/images/ic_navigate.svg',
                width: getNormalTextFontSIze(),
                color: ColorConstants.primaryColor,
              ),
            ],
          ),
          const Divider(
            color: ColorConstants.primaryColor,
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      ),
    );
  }
}
