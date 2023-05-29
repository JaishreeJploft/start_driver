import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/language_select_controller.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class LanguageSelectView extends GetView<LanguageSelectController> {
  const LanguageSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
              flex: 2,
              child: Center(
                child: addText('Choose Language', 21.sp,
                    ColorConstants.primaryColor, FontWeight.w400),
              )),
          Flexible(
              flex: 12,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: ColorConstants.white,
                    boxShadow: [getDeepBoxShadow()]),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: addText(
                            "Choose your preferred language",
                            16.sp,
                            ColorConstants.gretTextColor,
                            FontWeight.normal)),
                    SizedBox(
                      height: 8.h,
                    ),


                    SizedBox(
                      height: 20.h,
                      child: ListView.builder(
                        itemCount: controller.languageList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FadeInRight(
                            child: GestureDetector(
                              onTap: () async {
                                controller.selectedPos.value = index;
                              },
                              child: Obx(
                                () => Container(
                                  width: 38.w,
                                  margin:  EdgeInsets.symmetric(horizontal: 2.w),
                                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                      color: controller.selectedPos.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
                                      boxShadow: [getDeepBoxShadow()],
                                      border: controller.selectedPos.value == index ? Border.all(color: ColorConstants.primaryColor,width: 1.5) : null,
                                      borderRadius: getCurvedBorderRadius()),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 20),
                                    child: Stack(
                                      children: [

                                        Visibility(
                                            maintainSize: true,
                                            maintainAnimation: true,
                                            maintainState: true,
                                            visible: controller.selectedPos.value == index ? true : false,
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding: const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: ColorConstants.primaryColor,
                                                    boxShadow: [getDeepBoxShadow()],
                                                    border: Border.all(color: ColorConstants.white,width: 2)
                                                ),child: const Icon(Icons.check,color: ColorConstants.white,size: 15,),
                                              ),
                                            )),

                                        Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(controller.languageImageList[index]),
                                              SizedBox(height: 2.h,),
                                              addText(controller.languageList[index], getNormalTextFontSIze(), controller.selectedPos.value == index ? ColorConstants.primaryColor : ColorConstants.black, FontWeight.w600)
                                            ],
                                          ),
                                        )


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                         controller.updateLocale(controller.languageCodeList[controller.selectedPos.value]);
                      },
                      child: BorderedButton(width: 50.w, text: 'CONTINUE'),
                    )


                  ],
                ),
              ))
        ],
      )),
    );
  }
}
