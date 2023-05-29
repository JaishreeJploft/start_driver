import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/rating_controller.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/bordered_button2.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_star.dart';
import 'package:stardriver/common/utils.dart';

import '../../../points_added_removed_dialog.dart';

class NeedsStar extends GetView<RatingController> {
  const NeedsStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Get.back();
            showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
              return const StarPointDeductPop();
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: ColorConstants.borderColor2.withOpacity(0.5),
                borderRadius: getCurvedBorderRadius()),
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  top: 5,
                  child: SizedBox(
                    width: 5.6.w,
                    height: 5.6.w,
                    child: CustomPaint(
                      size: const Size(22, 22),
                      painter: RPSCustomPainter(
                          bgColor:
                              ColorConstants.primaryColor.withOpacity(0.4)),
                      child: Center(
                        child: addText('-2', getSmallestTextFontSIze() - 1.5,
                            ColorConstants.white, FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(controller.starRatingImageList[index]),
                      const SizedBox(
                        height: 5,
                      ),
                      addText(
                          controller.starHabitNames[index],
                          getSmallTextFontSIze() - 1,
                          ColorConstants.black,
                          FontWeight.bold)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: controller.starRatingImageList.length,
      ),
    );
  }
}

class StarPointDeductPop extends StatefulWidget {
  const StarPointDeductPop({Key? key}) : super(key: key);

  @override
  State<StarPointDeductPop> createState() => _StarPointDeductPopState();
}

class _StarPointDeductPopState extends State<StarPointDeductPop> {
  int maxSecond=60;
  int seconds = 60;
  Timer? timer;
  int tabIndex=1;
  void startTime(){
    timer?.cancel();
    seconds = 60;
    timer=Timer.periodic(const Duration(seconds: 1), (timers) {

      if(seconds > 0)
      {
        setState(() {
          seconds--;
        });

      }
      else{
        timer?.cancel();
      }
    });

  }
  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(onTap: (){Get.back();},
                  child: SvgPicture.asset("assets/images/close.svg",height: 16)),
            ),
            Text("Star Points Deduct",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp)),
            SizedBox(height: 4.h),
            Center(
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: ColorConstants.primaryColorLight,
                      strokeWidth: 1.2.h,
                      value: seconds/maxSecond,
                      valueColor: const AlwaysStoppedAnimation(ColorConstants.primaryColor),
                    ),
                    Center(
                      child: addText(seconds.toString(), 26, ColorConstants.primaryColor, FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: (){
                    Get.back(closeOverlays: true);
                    openPointsAddedRemovedDialog(added: false);
                  },
                  child: BorderedButton2(
                    text: "Confirm Deduction",
                    horizontalPadding: 0,
                  ),
                )),
                const SizedBox(width: 10),
                Expanded(child: GestureDetector(
                  onTap: (){
                    timer?.cancel();
                    Get.back(closeOverlays: true);
                  },
                  child: BorderedButton2(
                    text: "Issue Resolve",
                    horizontalPadding: 0,
                  ),
                 ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
