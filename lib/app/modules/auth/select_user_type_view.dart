import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/auth_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class SelectUserTypeView extends GetView<AuthController>{
  const SelectUserTypeView({super.key});

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
                    child: addText('Driver/Supervisor', getLargeTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.w400),
                  )),
              Flexible(
                  flex: 12,
                  child: Container(
                    padding: EdgeInsets.only(top: 4.h, left: 7.w, right: 7.w),
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: ColorConstants.white,
                        boxShadow: [getDeepBoxShadow()]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildGrids(),
                        SizedBox(height: 5.h,),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.loginView);
                          },
                          child: BorderedButton(width: 50.w, text: 'NEXT'),
                        ),
                         SizedBox(height: 10.h,),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }

  Widget buildGrids(){
    return GridView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          controller.selectedTypePos.value = index;
        },
        child: buildItem(index),
      ),
      itemCount:controller.roleTypeNameList.length,
    );
  }


  Widget buildItem(int index){
    return FadeInRight(
      duration: Duration(milliseconds: 300*(index+1)),
      child: Obx(() => Container(
        width: 38.w,
        margin:  EdgeInsets.symmetric(horizontal: 1.8.w),
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
            color: controller.selectedTypePos.value == index ? ColorConstants.primaryColorLight : ColorConstants.white,
            boxShadow: [getDeepBoxShadow()],
            border: controller.selectedTypePos.value == index ? Border.all(color: ColorConstants.primaryColor,width: 1.5) : null,
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
                  visible: true,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.selectedTypePos.value == index ? ColorConstants.primaryColor : ColorConstants.lightGreyColor,
                          boxShadow: [getDeepBoxShadow()],
                          border: Border.all(color: ColorConstants.white,width: 2)
                      ),child: const Icon(Icons.check,color: ColorConstants.white,size: 15,),
                    ),
                  )),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(controller.typeImagesList[index]),
                    SizedBox(height: 2.h,),
                    addAlignedText(controller.roleTypeNameList[index], 15.sp,  ColorConstants.black, FontWeight.w600)
                  ],
                ),
              )


            ],
          ),
        ),
      )),
    );
  }

}