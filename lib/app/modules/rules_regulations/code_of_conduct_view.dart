import 'package:get/get.dart';
import 'package:stardriver/app/controller/rules_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/rules_regulations/constant.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class CodeOfConductView extends GetView<RulesController> {
  const CodeOfConductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText(
                        'Some of the highlights that the code of conduct entails:',
                        getHeadingTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.bold),
                    SizedBox(
                      height: 2.h,
                    ),
                    addText(conduct1.tr, getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    SizedBox(
                      height: 4.h,
                    ),
                    addText(
                        'Code of Conduct for Workers in the General education Sector:',
                        getNormalTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.bold),
                    SizedBox(
                      height: 2.h,
                    ),
                    addText(conduct2.tr, getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          Obx(() => SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  checkColor: ColorConstants.primaryColor,
                                  activeColor: ColorConstants.primaryColorLight,
                                  value: controller.isRulesChecked.value,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => const BorderSide(
                                      width: 1.0,
                                      color: ColorConstants.primaryColor,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  onChanged: (bool? value) {
                                    controller.isRulesChecked.value = value!;
                                  },
                                ),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: addText(
                                  'I have read all the terms and responsibility guidelines and I agree to all of them.',
                                  getNormalTextFontSIze(),
                                  ColorConstants.black,
                                  FontWeight.w500))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                color: ColorConstants.primaryColorLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: ColorConstants.white,
                            border:
                                Border.all(color: ColorConstants.borderColor),
                            borderRadius: getCurvedBorderRadius()),
                        child: addAlignedText(
                            'Decline',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.normal),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.baseView);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 40.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getCurvedBorderRadius()),
                        child: addAlignedText('Agree', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.normal),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
