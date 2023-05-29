import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/wallet_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/events/event.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/purchase.dart';

import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class WalletView extends GetView<WalletController>{
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: controller.headingText.value,
          )),
      body: Column(
        children: [
          SizedBox(height: 2.h,),
          // buildTabs(),
          // SizedBox(height: 2.h,),
          // Expanded(
          //   child: TabBarView(
          //     controller: controller.tabController,
          //     physics: const NeverScrollableScrollPhysics(),
          //     children: const [
          //       Purchase(),
          //       Event()
          //     ],
          //   ),
          // )
          const Expanded(child: Purchase())


        ],
      ),
    );
  }

  Widget buildTabs(){
    return  SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: controller.tabListItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedTabPosition.value = index;
                controller.tabController.index = index;
              },
              child: Obx(
                    () => Container(
                  width: 40.w,
                  margin:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: controller.selectedTabPosition.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(child: addText(controller.tabListItems[index], getNormalTextFontSIze(), controller.selectedTabPosition.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}