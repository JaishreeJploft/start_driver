import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/orders_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class ShopOrders extends GetView<OrdersController>{
  const ShopOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildComplainList(context),
      ),
    );
  }

  Widget buildComplainList(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            boxShadow: [getBoxShadow()],
            borderRadius: getBorderRadius(),
            color: ColorConstants.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems('Order Id', '#45689'),
                      buildInfoItems('Order Total', '130 AED'),
                      buildInfoItems('Order Date', '28/06/2023'),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      if(index == 0){
                        Get.toNamed(Routes.returnOrderView);
                      } else {
                        showConfirmCancelDialog();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstants.primaryColorLight,
                          boxShadow: [getDeepBoxShadow()],
                          border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
                          borderRadius: getBorderRadiusCircular()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Center(
                          child: addText(index == 0 ? 'Return' : 'Cancel', getSmallTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.editOrderView);
                    },
                    child: SvgPicture.asset('assets/images/ic_edit.svg',height: getHeadingTextFontSIze(),),
                  ),

                ],
              ),



              buildDivider(),
              StepProgressView(width: 100.w,
                  curStep: controller.curStep,
                  statuses: controller.heading,
                  color: ColorConstants.primaryColor,
                  titles: controller.dates),




            ],
          ),
        );
      },
    );
  }

  buildLongReason(String image,String title,String description){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/$image.svg',
          height: getHeadingTextFontSIze(),
        ),
        const SizedBox(
          width: 10,
        ),
        addText(title, getSmallTextFontSIze() + 1,
            ColorConstants.black, FontWeight.normal),
        Expanded(
          child: addText(
              ' : $description',
              getSmallTextFontSIze() + 1,
              ColorConstants.primaryColor,
              FontWeight.bold),
        ),
      ],
    );
  }


  showConfirmCancelDialog(){
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.close,color: ColorConstants.lightGreyColor),
              ),),
              SizedBox(
                height: 2.h,
              ),
              addAlignedText('Are you sure you want to cancel this order?', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),

              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showCancelDialog();
                },
                child: CircularBorderedButton(width: 40.w, text: 'YES'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  showCancelDialog(){
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(Icons.close,color: ColorConstants.lightGreyColor),
                ),),
              SizedBox(
                height: 2.h,
              ),
              addAlignedText('Order Canceled, refund will be updated to your account within 3-5 business days', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircularBorderedButton(width: 40.w, text: 'Ok'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

}