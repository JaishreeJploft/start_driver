import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/common_buttons.dart';
import 'package:stardriver/app/modules/assignments/utils/common_sizes.dart';
import 'package:stardriver/app/modules/assignments/utils/constant_images.dart';
import 'package:stardriver/app/modules/assignments/utils/sizes.dart';
import 'package:stardriver/app/modules/assignments/widgets/base_button.dart';
import 'package:stardriver/app/modules/assignments/widgets/common_texts.dart';

void showSumitSuccessfulDialogue(BuildContext context, onTap) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: radiusAll(16)),
              insetPadding: EdgeInsets.all(10),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(borderRadius: radiusAll(16)),
                  padding: marginSymetric(12, 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: iconButton(() {
                              Get.back();
                            }, StarIcons.closeIconBlack),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                              child: textArialCenterExpanded(
                                  'Your Details has been submitted\nsuccessfully',
                                  dialogHeadingTs,
                                  Colors.black,
                                  FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      spaceheight(2.h),
                      BaseButton(
                          btnType: 'popup', title: 'Ok', onPressed: onTap),
                      spaceheight(2.h)
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
