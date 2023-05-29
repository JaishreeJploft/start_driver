import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/orders_controller.dart';
import 'package:stardriver/app/controller/shop_controller.dart';
import 'package:stardriver/app/modules/shop/sub_pages/orders/canteen_orders/canteen_orders.dart';
import 'package:stardriver/app/modules/shop/sub_pages/orders/shop_orders.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class OrdersView extends GetView<OrdersController>{
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          Container(
            width: 100.w,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                // boxShadow: [getBoxShadow()],
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.primaryColorLight),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: buildSchoolDropDown(),
          ),
          SizedBox(
            height: 1.h,
          ),
          buildTabs(),

          SizedBox(height: 1.h,),
          Expanded(
            child: TabBarView(
              controller: controller.orderTabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ShopOrders(),
                CanteenOrders()
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: Get.find<ShopController>().schoolItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.gretTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: Get.find<ShopController>().selectedSchool.value,
          onChanged: (value) {
            Get.find<ShopController>().selectedSchool.value = value.toString();
          },
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze() * 1.5,
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 78.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: const Offset(-20, 0),
        ),
      )),
    );
  }

  Widget buildTabs(){
    return  SizedBox(
      height: 5.h,
      child: Center(
        child: ListView.builder(
          itemCount: controller.orderTabController.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                controller.selectedOrderTabPosition.value = index;
                controller.orderTabController.index = index;
              },
              child: Obx(
                    () => Container(
                  width: 43.w,
                  margin:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                  // padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: controller.selectedOrderTabPosition.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Center(child: addText(controller.orderTabListItems[index], getNormalTextFontSIze(), controller.selectedOrderTabPosition.value == index ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }



}