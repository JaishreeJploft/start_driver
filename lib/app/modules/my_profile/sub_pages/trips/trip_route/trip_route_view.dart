import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/trip_route_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import '../../../../../../common/bordered_button.dart';

class TripRouteView extends GetView<TripRouteController>{
  const TripRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(5.h), child:  AppHeader(showBackIcon: true, title: 'Route',)),
      body: Container(
        margin: const  EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: getCurvedBorderRadius(),
                child : Container(
                    decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      border: Border.all(color: ColorConstants.borderColor2,width: 2),
                      boxShadow: [getBoxShadow()]
                    ),
                    child: Image.asset('assets/images/im_route_polyline.png'))
            ),
            SizedBox(
              height: 20,
            ),
            BorderedButton(width: 60.w, text: 'Notify')
          ],
        ),
      ),
    );
  }

}