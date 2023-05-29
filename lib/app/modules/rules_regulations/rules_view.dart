import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/rules_controller.dart';
import 'package:stardriver/app/modules/rules_regulations/constant.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class RulesView extends GetView<RulesController> {
  const RulesView({super.key});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText(
                        'Responsibilities of School Bus Drivers& Supervisors:',
                        getHeadingTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.bold),
                    SizedBox(
                      height: 2.h,
                    ),
                    addText('Aims and Principals', getSubheadingTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    SizedBox(
                      height: 2.h,
                    ),
                    addText(ruleText.tr, getSubheadingTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => SizedBox(
                                height: 22,
                                width: 22,
                                child: Checkbox(
                                  checkColor: ColorConstants.primaryColor,
                                  activeColor: ColorConstants.primaryColorLight,
                                  value: controller.isRulesChecked.value,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
                          SizedBox(
                            width: 3.w,
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
                        Get.toNamed(Routes.codeOfConductView);
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
