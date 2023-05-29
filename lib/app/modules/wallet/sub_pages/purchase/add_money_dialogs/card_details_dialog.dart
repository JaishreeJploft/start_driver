import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/purchase_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class CardDetailsDialog extends GetView<PurchaseController>{



  const CardDetailsDialog({super.key});

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

                  addText('Card Details', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
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
                child: addEditText2(controller.cardNumberController!, 'Card Number'),
              ),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: getEditTextDecoration(),
                        child: Row(
                          children: [
                            Flexible(child: addEditText2(controller.cardExpiryController!, 'Expiry')),
                            SvgPicture.asset('assets/images/ic_calendar.svg',height: getHeadingTextFontSIze(),)
                          ],
                        ),
                  )),
                  const SizedBox(width: 10,),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: getEditTextDecoration(),
                        child: Row(
                          children: [
                            Flexible(child: addEditText2(controller.cardExpiryController!, 'CVV')),
                            SvgPicture.asset('assets/images/ic_info.svg',height: getHeadingTextFontSIze(),)
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(height: 1.h,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child: addEditText2(controller.cardNumberController!, 'Card holder name'),
              ),
              SizedBox(height: 1.h,),


              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){
                  Get.dialog(SuccessDialog(message: 'Wallet amount has been credited\nsuccessful!',));
                },
                child: CircularBorderedButton(width: 50.w, text: 'PAY'),
              )


            ],
          ),
        ),
      ),
    );
  }

}