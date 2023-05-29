import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/base_controller.dart';
import 'package:stardriver/app/modules/chat/chat_view.dart';
import 'package:stardriver/app/modules/home/home_view.dart';
import 'package:stardriver/app/modules/my_profile/my_profile_view.dart';
import 'package:stardriver/app/modules/search/search_view.dart';
import 'package:stardriver/app/modules/trip_operation/trip_operation_view.dart';
import 'package:stardriver/common/bottom_app_bar/curved_navigation_bar.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class BaseView extends GetView<BaseController>{
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          CurvedNavigationBar(
            buttonBackgroundColor: ColorConstants.primaryColorLight,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeOut,
            index: 2,
            color: ColorConstants.primaryColorLight,
            height: GetPlatform.isIOS ? 85.0 : 75.0,
            items: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/nav_trip.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/nav_search.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/app_logo2.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/nav_chat.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/nav_account.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          Positioned(
            bottom: (GetPlatform.isIOS ? 15.0 : 5.0),
            right: 0,
            left: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 20.w,alignment: Alignment.center,child: addAlignedText('Trip', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                  Container(width: 20.w,alignment: Alignment.center,child: addAlignedText('Search', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                  Container(width: 20.w,alignment: Alignment.center,child: addAlignedText('Home', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                  Container(width: 20.w,alignment: Alignment.center,child: addAlignedText('Chats', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                  Container(width: 20.w,alignment: Alignment.center,child: addAlignedText('Account', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),),
                ]
            ),
          )
        ],
      ),
      body: Obx(() => buildPages()),
      // bottomNavigationBar: Stack(
      //   children: [
      //     CurvedNavigationBar(
      //       key: controller.bottomNavigationKey,
      //       buttonBackgroundColor: ColorConstants.primaryColorLight,
      //       height: 7.5.h,
      //       backgroundColor: Colors.transparent.withOpacity(0),
      //       // animationCurve: Curves.easeInOut,
      //       index: 2,
      //       color: ColorConstants.primaryColorLight,
      //
      //       items: <Widget>[
      //
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SvgPicture.asset(
      //             'assets/images/nav_trip.svg',
      //             width: 25,
      //             height: 25,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SvgPicture.asset(
      //             'assets/images/nav_search.svg',
      //             width: 25,
      //             height: 25,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SvgPicture.asset(
      //             'assets/images/app_logo2.svg',
      //             width: 25,
      //             height: 25,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SvgPicture.asset(
      //             'assets/images/nav_chat.svg',
      //             width: 25,
      //             height: 25,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: SvgPicture.asset(
      //             'assets/images/nav_account.svg',
      //             width: 25,
      //             height: 25,
      //           ),
      //         ),
      //       ],
      //       onTap: (index) {
      //         controller.currentIndex.value = index;
      //       },
      //       // titles: ['Trip','Search','Home','Chats','Account'],
      //     ),
      //     // Positioned(
      //     //   bottom: 5,
      //     //   left: 0,
      //     //   right: 0,
      //     //   child: SafeArea(
      //     //     child: Row(
      //     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //       children: [
      //     //         addAlignedText('  Trip', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
      //     //         addAlignedText('    Search', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
      //     //         addAlignedText('Home', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
      //     //         addAlignedText('Chats', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
      //     //         addAlignedText(' Account', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
      //     //       ],
      //     //     ),
      //     //   ),
      //     // )
      //   ],
      // ),
    );
  }



  Widget buildPages() {
    switch (controller.currentIndex.value) {
      case 0:
        return const TripOperationView();
      case 1:
        return const SearchView();
      case 2:
        return const HomeView();
      case 3:
        return const ChatView();
      case 4:
        return const MyProfileView();
      default:
        return const HomeView();
    }
  }


}