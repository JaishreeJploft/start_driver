import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/rating_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_star.dart';
import 'package:stardriver/common/utils.dart';
import 'package:stardriver/points_added_removed_dialog.dart';

class PositiveStar extends GetView<RatingController> {
  const PositiveStar({super.key});

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
            openPointsAddedRemovedDialog(added: true);
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
                      painter: const RPSCustomPainter(),
                      child: Center(
                        child: addText('+2', getSmallestTextFontSIze() - 1.5,
                            ColorConstants.white, FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
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
