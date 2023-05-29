import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/purchase_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/card_details_dialog.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class TopUpFamilyDialog extends GetView<PurchaseController>{
  const TopUpFamilyDialog({super.key});

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
                children: [

                  addText('Top up your', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  addText(' Family Wallet', getSubheadingTextFontSIze(),
                      ColorConstants.primaryColor, FontWeight.bold),
                  const Spacer(),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: addEditText2(controller.amountController!, 'AED 10'),
              ),
          SizedBox(height: 1.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.amountController?.text = 'AED 10';
                    controller.amountText.value = 'AED 10';
                  },
                  child: buildChip('+AED10'),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: (){
                    controller.amountController?.text = 'AED 20';
                    controller.amountText.value = 'AED 20';
                  },
                  child: buildChip('+AED20'),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: (){
                    controller.amountController?.text = 'AED 30';
                    controller.amountText.value = 'AED 30';
                  },
                  child: buildChip('+AED30'),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: (){
                    controller.amountController?.text = 'AED 40';
                    controller.amountText.value = 'AED 40';
                  },
                  child: buildChip('+AED40'),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: (){
                    controller.amountController?.text = 'AED 50';
                    controller.amountText.value = 'AED 50';
                  },
                  child: buildChip('+AED50'),
                ),


              ],
            ),
          ),

              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){
                  Get.dialog( const CardDetailsDialog());
                },
                child: Obx(() => CircularBorderedButton(width: 50.w, text: 'TOP UP ${controller.amountText.value.toString()}')),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget buildChip(String text){
    return Chip(label: addText(text, getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
      backgroundColor: ColorConstants.primaryColorLight,
      padding: EdgeInsets.zero,
      side: const BorderSide(color: ColorConstants.primaryColor),
    );
  }

}