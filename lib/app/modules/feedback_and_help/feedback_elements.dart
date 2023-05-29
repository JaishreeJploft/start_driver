import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

void showCommentDialog(TextEditingController controller) {
  Get.dialog(Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.transparent,
                  ),
                ),
                addText('Add Comment', getSubheadingTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
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
              child:
                  buildLineEditText(controller, 'Comment'),
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {},
              child: BorderedButton(width: 30.w, text: 'SUBMIT'),
            )
          ],
        ),
      ),
    ),
  ));
}
