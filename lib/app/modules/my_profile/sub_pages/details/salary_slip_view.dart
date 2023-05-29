import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/salary_slip_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class SalarySlipView extends GetView<SalaryClipController> {
  SalarySlipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Salary Slip',
          )),
      body: ListView.builder(
        itemCount: monthsList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildSalarySlipItem(index, context, monthsList[index]);
        },
      ),
    );
  }

  List<String> monthsList = [
    "August",
    "July",
    "June",
    "May",
    "April",
    "March",
    "February",
    "January"
  ];

  Widget buildSalarySlipItem(int index, BuildContext context, String text) {
    return Container(
      width: 100.w,
      height: 60,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      decoration: BoxDecoration(
          boxShadow: [getDeepBoxShadow()],
          borderRadius: getBorderRadius(),
          color: ColorConstants.white,
          border: Border.all(color: ColorConstants.borderColor2)),
      child: Row(
        children: [
          Transform.translate(
            offset: const Offset(-1, 0),
            child: Transform.scale(
              scale: 1.02,
              child: Container(
                width: 20.w,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: getBorderRadius(),
                    border: Border.all(color: ColorConstants.primaryColor),
                    color: ColorConstants.primaryColorLight),
                child: Column(
                  children: [
                    addText('10', getLargeTextFontSIze() - 8,
                        ColorConstants.primaryColor, FontWeight.bold),
                    addText(text, getSmallTextFontSIze(),
                        ColorConstants.primaryColor, FontWeight.normal),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addText('Payment Received', getNormalTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              const SizedBox(
                height: 5,
              ),
              addText('1000 AED', getNormalTextFontSIze(),
                  ColorConstants.primaryColor, FontWeight.bold),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.download_for_offline,
                  color: ColorConstants.primaryColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showSalarySlipView(context, index);
                },
                child: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  showSalarySlipView(BuildContext context, int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,
            scrollable: true,
            insetPadding: const EdgeInsets.all(14),
            title: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: addAlignedText(
                      "Pay Slip of July",
                      getHeadingTextFontSIze(),
                      ColorConstants.black,
                      FontWeight.w600),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      ),
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: getCurvedBorderRadius()),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Image.asset(
                      'assets/images/pdf.png',
                      color: ColorConstants.lightGreyColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    addText('12/07/2022', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            )));
  }
}
