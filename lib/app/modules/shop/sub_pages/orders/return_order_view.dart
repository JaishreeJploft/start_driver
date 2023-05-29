import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/cart_controller.dart';
import 'package:stardriver/app/controller/edit_order_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/top_up_family_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ReturnOrderView extends GetView<EditOrderController>{
  const ReturnOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Return Items',
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    addText('Order Id : ', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    addText('#45689', getNormalTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.bold),
                  ],
                )),
            SizedBox(height: 1.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: addAlignedText('Select Items you want to Return',  getSubheadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
            ),
            SizedBox(height: 1.h,),
            ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  children: [

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color: ColorConstants.white,
                          borderRadius: getCurvedBorderRadius(),
                          boxShadow: [getDeepBoxShadow()]
                      ),
                      child: Row(
                        children: [

                          ClipRRect(
                            borderRadius: getCurvedBorderRadius(),
                            child: Image.network('https://picsum.photos/id/${(index*8)}/200/300',width: 20.w,height: 20.w,fit: BoxFit.cover,),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('NFC Tags', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                              const SizedBox(height: 2,),
                              addText('15 AED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                              const SizedBox(height: 2,),

                              buildInfoItems('Quantity', '1')



                            ],
                          ))

                        ],
                      ),
                    ),

                    if(index.isEven)
                    Positioned(
                        top: 0,
                        bottom: 0,
                        child: SvgPicture.asset('assets/images/active_checkbox.svg')),


                    if(index.isOdd)
                      Positioned(
                          top: 0,
                          bottom: 0,
                          child: SvgPicture.asset('assets/images/inactive_checkbox.svg')),

                  ],
                );
              },
            ),


            SizedBox(height: 3.h,),

            Container(
              width: 100.w,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor2)
              ), child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText(' Select Shipping', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                SizedBox(height: 1.h,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      children: <Widget>[
                        Radio(
                          value: "Collect From Home",
                          groupValue: controller.friendsRadioValue.value,
                          activeColor: ColorConstants.primaryColor,
                          visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                          onChanged: (value){
                            controller.friendsRadioValue.value = value.toString();
                          },
                        ),
                        Text("Collect From Home".tr, style: TextStyle(fontSize: getNormalSmallTextFontSIze(),fontWeight: FontWeight.normal),)
                      ],
                    ),

                    const SizedBox(width: 10,),

                    Row(
                      children: <Widget>[
                        Radio(
                          value: "Deliver to School",
                          groupValue: controller.friendsRadioValue.value,
                          activeColor: ColorConstants.primaryColor,
                          visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                          onChanged: (value){
                            controller.friendsRadioValue.value = value.toString();
                          },
                        ),
                        Text("Deliver to School".tr,style: TextStyle(fontSize: getNormalSmallTextFontSIze(),fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ],
                )),



              ],
            ),
            ),

            SizedBox(height: 3.h,),



            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      // Get.dialog(buildWalletDialog());
                    },
                    child: BorderedButton(width: 0, text: 'RETURN'),
                  )







                ],
              ),
            ),


            SizedBox(height: 4.h,),


          ],
        ),
      ),
    );
  }

  Widget buildBill(String title,String amount){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
        addText(amount, getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
      ],
    );
  }

  Widget buildCardDetailsDialog(){
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
                  Get.back();
                  Get.dialog(const SuccessDialog(message: 'Order successfully placed!',));

                },
                child: CircularBorderedButton(width: 50.w, text: 'PAY'),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget buildWalletDialog(){
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

                  addText('Wallet', getSubheadingTextFontSIze(),
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
                margin: const EdgeInsets.symmetric(horizontal: 0),
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
                        Get.dialog(buildCardDetailsDialog());
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


              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: (){
                  Get.back();
                  Get.dialog(const SuccessDialog(message: 'Order successfully placed!',));

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