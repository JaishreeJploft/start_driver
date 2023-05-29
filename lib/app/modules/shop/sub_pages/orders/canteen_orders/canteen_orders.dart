import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/orders_controller.dart';
import 'package:stardriver/app/modules/shop/sub_pages/orders/canteen_orders/canteen_order_week_view.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class CanteenOrders extends GetView<OrdersController>{
  const CanteenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          buildTabs2(),
          SizedBox(height: 1.h,),
          Expanded(
            child: TabBarView(
              controller: controller.weekTabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CanteenOrderWeekView(type: 0,),
                CanteenOrderWeekView(type: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget buildTabs2(){
    return  SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: controller.weekTabController.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedWeekTabPosition.value = index;
                controller.weekTabController.index = index;
              },
              child: Obx(
                    () => Container(
                  width: 43.w,
                  margin:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: controller.selectedWeekTabPosition.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(child: addText(controller.weekTabListItems[index], getNormalTextFontSIze(), controller.selectedWeekTabPosition.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }



}