import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AppHeader extends StatefulWidget {
  bool showBackIcon;
  String title;
  bool? notificationIcon;

  AppHeader({Key? key, required this.showBackIcon,required this.title,this.notificationIcon}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorConstants.white,
        title: addText(widget.title, getHeadingTextFontSIze(),
            ColorConstants.black, FontWeight.bold),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorConstants.black),
        leading: widget.showBackIcon
            ? IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Colors.black,size: getLargeTextFontSIze() * 1.2,),
          onPressed: () => Navigator.of(context).pop(),
        )
            : const SizedBox.shrink(),
        actions: [
          widget.notificationIcon == false? SizedBox():GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notificationView);
            },
            child: SvgPicture.asset('assets/images/notification.svg',
                height: getLargeTextFontSIze() * 1.2),
          ),
          const SizedBox(
            width: 15,
          )
        ]);
  }
}
