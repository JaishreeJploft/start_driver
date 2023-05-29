import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';

class PrintQrDialog extends StatefulWidget {
  const PrintQrDialog({Key? key}) : super(key: key);

  @override
  State<PrintQrDialog> createState() => _PrintQrDialogState();
}

class _PrintQrDialogState extends State<PrintQrDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'QR Code',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/qrcode.svg',
            width: 80.w,
          ),
          SizedBox(
            height: 3.h,
          ),
          GestureDetector(
            onTap: () {},
            child: CircularBorderedButton(
              width: 2,
              text: 'PRINT QR',
              capFirst: false,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
