import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/routes/app_routes.dart';
import 'circular_bordered_button.dart';
import 'color_constants.dart';
import 'utils.dart';

class LogoutDialog extends StatefulWidget {
  final String message;


  const LogoutDialog({Key? key, required this.message}) : super(key: key);

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      'assets/images/close.svg',
                      height: 15,
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
              addAlignedText(widget.message, getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      // Get.back();
                      // Get.back();
                    },
                    child: CircularBorderedButton(width: 30.w, text: 'NO',isActive: false,),
                  ),
                  GestureDetector(
                    onTap: () async{
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      await preferences.clear();
                      Get.offAllNamed(Routes.loginView);
                    },
                    child: CircularBorderedButton(width: 30.w, text: 'YES'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}