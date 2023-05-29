import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class SOSAppHeader extends StatefulWidget {
  bool showBackIcon;
  String title;

  SOSAppHeader({Key? key, required this.showBackIcon,required this.title}) : super(key: key);

  @override
  State<SOSAppHeader> createState() => _SOSAppHeaderState();
}

class _SOSAppHeaderState extends State<SOSAppHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorConstants.white,
        title: addText(widget.title, getSubheadingTextFontSIze(),
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
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.sosView);
            },
            child: SvgPicture.asset(
              'assets/images/ic_sos.svg',
              height: getLargeTextFontSIze() * 1.3,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
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
