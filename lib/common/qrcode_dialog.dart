import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

Future<void> showDialogBox() {
  return Get.dialog(Scaffold(
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
                addText('Qr Code', getSubheadingTextFontSIze(),
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
            SvgPicture.asset(
              'assets/images/qrcode.svg',
              width: 60.w,
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    ),
  ));
}
