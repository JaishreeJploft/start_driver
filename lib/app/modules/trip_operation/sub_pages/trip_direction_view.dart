import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/remaining_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class TripDirectionView extends GetView<RemainingController>{
  const TripDirectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Map',
          )),
      body: Column(
        children: [
          SizedBox(height: 2.h,),
          Center(child: Container(
              decoration: getEditTextDecoration(),
              child: ClipRRect(
                  borderRadius: getBorderRadius(),
                  child: Image.asset('assets/images/map.png',height: 50.h,fit: BoxFit.cover,width: 90.w,)))),
          SizedBox(height: 3.h,),
          BorderedButton(width: 60.w, text: 'Start Direction')

        ],
      ),
    );
  }

}