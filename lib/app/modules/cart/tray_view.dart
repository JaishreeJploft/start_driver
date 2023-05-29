import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/cart_controller.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class TrayView extends GetView<CartController>{
  const TrayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Tray',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          addText('First Break Items', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                            decoration: BoxDecoration(
                                color: ColorConstants.primaryColorLight,
                                boxShadow: [getDeepBoxShadow()],
                                border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                                borderRadius: getBorderRadiusCircular()),
                            child: Center(
                              child: addText('Add Item', getNormalTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w500),
                            ),
                          )
                        ],
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        padding: const EdgeInsets.all(10),
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
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/images/ic_delete.svg',color: Colors.red,),
                                    addText('Remove', getNormalTextFontSIze(), Colors.red, FontWeight.normal)
                                  ],
                                )
                              ],
                            ))

                          ],
                        ),
                      ),
                      SizedBox(height: 1.h,),

                    ],
                  );
                },
              ),
              SizedBox(height: 1.h,),
              const Divider(),
              SizedBox(height: 2.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText('Order Type', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                  SizedBox(height: 1.h,),
                  Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        title: Text("This Week".tr,style: TextStyle(fontSize: getNormalTextFontSIze(),fontWeight: FontWeight.normal),),
                        value: "This Week",
                        dense: true,
                        groupValue: controller.orderTypeRadioValue.value,
                        activeColor: ColorConstants.primaryColor,
                        onChanged: (value){
                          controller.orderTypeRadioValue.value = value.toString();
                        },
                      ),
                    ),

                    SizedBox(
                      width: 40.w,
                      child: RadioListTile(

                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        contentPadding: const EdgeInsets.all(0),
                        title: Text("Every Week".tr,style: TextStyle(fontSize: getNormalTextFontSIze(),fontWeight: FontWeight.normal)),
                        value: "Every Week",
                        dense: true,
                        groupValue: controller.orderTypeRadioValue.value,
                        activeColor: ColorConstants.primaryColor,
                        onChanged: (value){
                          controller.orderTypeRadioValue.value = value.toString();
                        },
                      ),
                    ),
                  ],
                )),
                  SizedBox(height: 2.h,),
                  Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: getCurvedBorderRadius(),
                    boxShadow: [getDeepBoxShadow()]
                  ), child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 0,
                  childAspectRatio: 5,
                  mainAxisSpacing: 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      controller.daysList.length, (index) {
                    return Obx(() => Card(
                      color: Colors.white,
                      margin: EdgeInsets.zero,
                      elevation: 0.0,
                      child: CheckboxListTile(

                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                            horizontal: -4, vertical: -4),
                        activeColor: ColorConstants.primaryColorLight,
                        checkColor: ColorConstants.primaryColor,
                        dense: true,
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                            width: 1.0,
                            color: ColorConstants.primaryColor,
                          ),
                        ),




                        // activeColor: ColorConstants.primaryColor,
                        // contentPadding: EdgeInsets.zero,
                        // visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        // checkboxShape: const RoundedRectangleBorder(borderRadius: BorderRadius. all(Radius. circular(5.0))),
                        title: addText(controller.daysList[index], getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        value: controller.selectedIndexes.contains(controller.daysList[index]),
                        onChanged: (_) {
                          if (controller.selectedIndexes.contains(controller.daysList[index])) {
                            controller.selectedIndexes.remove(controller.daysList[index]);
                          } else {
                            controller.selectedIndexes.add(controller.daysList[index]);

                          }
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ));
                  }),
                ),









                ),
                  SizedBox(height: 3.h,),
                  addText('Order Type', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                  SizedBox(height: 1.h,),
                  Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        title: Text("Collecting".tr,style: TextStyle(fontSize: getNormalTextFontSIze(),fontWeight: FontWeight.normal),),
                        value: "Collecting",
                        dense: true,
                        groupValue: controller.servingRadioValue.value,
                        activeColor: ColorConstants.primaryColor,
                        onChanged: (value){
                          controller.servingRadioValue.value = value.toString();
                        },
                      ),
                    ),

                    SizedBox(
                      width: 40.w,
                      child: RadioListTile(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        contentPadding: const EdgeInsets.all(0),
                        title: Text("Deliver".tr,style: TextStyle(fontSize: getNormalTextFontSIze(),fontWeight: FontWeight.normal)),
                        value: "Deliver",
                        dense: true,
                        groupValue: controller.servingRadioValue.value,
                        activeColor: ColorConstants.primaryColor,
                        onChanged: (value){
                          controller.servingRadioValue.value = value.toString();
                        },
                      ),
                    ),
                  ],
                )),
                ],
              ),

              SizedBox(height: 1.h,),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.borderColor2),
                  borderRadius: getCurvedBorderRadius()
                ),
                child: Row(
                  children: [

                    Flexible(
                        flex: 2,
                        child: Container(
                          height: 5.h,
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                          decoration: getEditTextDecoration(),
                          child: Row(
                            mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                            addText('10:30 AM', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                            SvgPicture.asset('assets/images/ic_time.svg',color: ColorConstants.black,)
                          ],),
                        )),
                    const SizedBox(width: 10,),
                    Flexible(
                        flex: 3,
                        child: Container(
                          height: 5.h,
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                          decoration: getEditTextDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            addText('Location', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                            const Icon(Icons.keyboard_arrow_down,color: ColorConstants.black,)
                          ],),
                        ))


                  ],
                ),
              ),

              SizedBox(height: 3.h,),

              buildBill('Sub Total', '130 AED'),
              SizedBox(height: 1.h,),
              buildBill('Taxes (5%)', '6.5 AED'),
              SizedBox(height: 1.h,),
              buildBill('Grand Total', '136.5 AED'),
              SizedBox(height: 1.h,),
              const Divider(),
              SizedBox(height: 1.h,),
              addText('Note:\n1-Order can be cancelled before 24 hours of serving.\n2-Amount will be deduct from the wallet when order is served',
                  getSmallTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal),


              SizedBox(height: 3.h,),

              Center(
                child: GestureDetector(
                  onTap: (){
                    Get.dialog(buildCardDetailsDialog());
                  },
                  child: BorderedButton(width: 70.w, text: 'SCHEDULE ORDER'),
                ),
              ),
              SizedBox(height: 3.h,),


            ],
          ),
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
                  Get.dialog(SuccessDialog(message: 'Order successfully placed!',));

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