import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/common_buttons.dart';
import 'package:stardriver/app/modules/assignments/utils/common_sizes.dart';
import 'package:stardriver/app/modules/assignments/utils/constant_images.dart';
import 'package:stardriver/app/modules/assignments/utils/contanst_colors.dart';
import 'package:stardriver/app/modules/assignments/utils/sizes.dart';

import '../widgets/common_texts.dart';

AppBar appBarWithSosAndNotification(
    leadingOnTap, title, sosOnTap, notificationOnTap) {
  return AppBar(
    leading: backButton(leadingOnTap),
    centerTitle: true,
    title: textArial(title, appBarHeadingTs, Colors.black, FontWeight.w700),
    actions: [
      iconButton(sosOnTap, StarIcons.sosIcon),
      spacewidth(2.h),
      iconButton(notificationOnTap, StarIcons.notificationIcon),
      spacewidth(1.5.h),
    ],
    elevation: 0,
    backgroundColor: StarColors.scaffoldColor,
  );
}

AppBar appBar1(leadingOnTap, title, actionOntap) {
  return AppBar(
    elevation: 0,
    backgroundColor: StarColors.scaffoldColor,
    leading: backButton(leadingOnTap),
    centerTitle: true,
    title: textArial(title, appBarHeadingTs, Colors.black, FontWeight.w700),
    actions: [
      iconButton(actionOntap, StarIcons.notificationIcon),
      spacewidth(15)
    ],
  );
}

AppBar appBar2(leadingOnTap, title, actionOntap) {
  return AppBar(
    elevation: 0,
    backgroundColor: StarColors.yellowSecondary,
    leading: backButton(leadingOnTap),
    centerTitle: true,
    title: textArial(
      title,
      appBarHeadingTs,
      Colors.black,
      FontWeight.w700,
    ),
    actions: [
      iconButton(actionOntap, StarIcons.notificationIcon),
      spacewidth(15)
    ],
  );
}

AppBar appBar3(leadingOnTap, title, titleColor) {
  return AppBar(
    elevation: 0,
    backgroundColor: StarColors.scaffoldColor,
    leading: backButton(leadingOnTap),
    centerTitle: true,
    title: textArial(title, appBarHeadingTs,
        titleColor != null ? titleColor : StarColors.black, FontWeight.w700),
  );
}
