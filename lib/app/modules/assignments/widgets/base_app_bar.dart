import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/assignments/utils/constant_images.dart';
import 'package:stardriver/app/modules/assignments/utils/sizes.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';

import '../utils/common_texts.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? showSos;
  final bool? showNotification;
  final bool? showBackIcon;
  final Function()? onDrawerPressed;
  final Function()? onBackPressed;

  const BaseAppBar(
      {Key? key,
      this.title,
      this.showSos = false,
      this.onBackPressed,
      this.showNotification = true,
      this.showBackIcon = true,
      this.onDrawerPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      title: /*Text(title??"",
          style: Style.montserratBoldStyle().copyWith(
              fontSize: appBarHeadingTs, color: ColorConstants.black))*/
          textArial(title ?? "", appBarHeadingTs, ColorConstants.black,
              FontWeight.w700),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: onDrawerPressed != null

          ///   Drawer Icon
          ? GestureDetector(
              onTap: onDrawerPressed,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                // child: SvgPicture.asset(drawerSvg),
                child: SvgPicture.asset(StarIcons.drawerIcon),
              ))

          ///   Back Icon
          : Visibility(
              visible: showBackIcon ?? true,
              child: GestureDetector(
                  onTap: onBackPressed ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.black, size: 20.sp)),
            ),
      actions: [
        ///  SOS Icon
        Visibility(
          visible: showSos ?? false,
          child: InkWell(
            onTap: () {
              // Get.to(const SOSView());
              Get.toNamed(Routes.sosView);
            },
            // child: SvgPicture.asset(sosSvg),
            child: SvgPicture.asset(StarIcons.sosIcon),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),

        /// Notification Icon
        Visibility(
          visible: showNotification ?? true,
          child: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.notificationView);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  // const NotificationScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: SvgPicture.asset(StarIcons.notificationIcon,
                      height: 24.sp, width: 24.sp),
                ),
              ),

              /// Notification Count
              Positioned(
                top: 1.8.h,
                child: Container(
                  height: 17.sp,
                  width: 17.sp,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primaryColor),
                  child: Text("1",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
