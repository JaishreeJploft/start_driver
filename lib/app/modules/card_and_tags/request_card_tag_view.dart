import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/utils.dart';


import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../controller/card_and_tag_controller.dart';


class RequestCardAndTagsView extends GetView<CardAndTagsController> {
  const RequestCardAndTagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Request Cards & Tags',
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 25.h,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) => FadeInRight(
                  duration: Duration(milliseconds: 200*(index+1)),
                  child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    boxShadow: kElevationToShadow[2],
                    color: ColorConstants.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                        ),
                        width: double.infinity,
                        height: 15.h,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Image.asset(controller.imageList[index]),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText(
                              'NFC Tags',
                              getNormalTextFontSIze() + 2,
                              ColorConstants.black,
                              FontWeight.w400),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addText(
                                  '10 AED',
                                  getNormalTextFontSIze(),
                                  ColorConstants.primaryColor,
                                  FontWeight.w500),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: getCurvedBorderRadius(),
                                      border: Border.all(color: ColorConstants.primaryColor),
                                      color: ColorConstants.primaryColorLight),
                                  child: Row(
                                    children: [
                                       Icon(Icons.remove,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                                       addText(' 2 ', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                                       Icon(Icons.add,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ),
            SizedBox(height:2.h),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.cartView);
                },
                child: BorderedButton(width: 50.w, text: 'REQUEST'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: ColorConstants.borderColor2.withOpacity(0.5),
      thickness: 2,
      height: 3.h,
    );
  }
}
