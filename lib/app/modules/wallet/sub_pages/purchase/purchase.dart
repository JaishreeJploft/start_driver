import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/purchase_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/top_up_family_dialog.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/transaction.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class Purchase extends GetView<PurchaseController>{
  const Purchase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: getCurvedBorderRadius(),
                boxShadow: [getLightBoxShadow()],
                border: Border.all(color: ColorConstants.primaryColor),
                color: ColorConstants.primaryColorLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                SvgPicture.asset('assets/images/ic_coins.svg',width: 15.w,),

                Column(
                  children: [
                    SizedBox(height: 1.h,),
                    addText('Balance', getLargeTextFontSIze(), ColorConstants.primaryColor, FontWeight.w400),
                    SizedBox(height: 1.h,),
                    addText('213 AED', getLargeTextFontSIze()*1.2, ColorConstants.primaryColor, FontWeight.w500),
                    SizedBox(height: 1.h,),
                  ],
                ),

                GestureDetector(
                  onTap: (){
                    Get.dialog(const TopUpFamilyDialog());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstants.primaryColorLight,
                        shape: BoxShape.circle,
                        boxShadow: [getBoxShadow()],
                        border: Border.all(color: ColorConstants.primaryColor)
                    ),child: const Icon(Icons.add,color: ColorConstants.primaryColor,size: 50,),
                  ),
                )

              ],
            ),
          ),
          SizedBox(height: 2.h,),
          buildTabs(),
          SizedBox(height: 2.h,),
          Expanded(
            child: TabBarView(
              controller: controller.purchaseTabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                TransactionView(type: 1,),
                TransactionView(type: 2,),
              ],
            ),
          )

        ],
      ),

    );
  }

  Widget buildTabs(){
    return  SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: controller.purchaseTabListItems.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedPurchaseTabPosition.value = index;
                controller.purchaseTabController.index = index;
              },
              child: Obx(
                    () => Container(
                  width: 40.w,
                  margin:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: controller.selectedPurchaseTabPosition.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(child: addText(controller.purchaseTabListItems[index], getNormalTextFontSIze(), controller.selectedPurchaseTabPosition.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}