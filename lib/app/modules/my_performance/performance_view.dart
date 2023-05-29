import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/performance_controller.dart';
import 'package:stardriver/app/modules/my_performance/sub_pages/management.dart';
import 'package:stardriver/app/modules/my_performance/sub_pages/parents.dart';
import 'package:stardriver/app/modules/my_performance/sub_pages/staff.dart';
import 'package:stardriver/app/modules/my_performance/sub_pages/stars.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/base_tab_bar.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class PerformanceView extends GetView<PerformanceController>{
  const PerformanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Performance',
          )),
      body: Column(
        children: [

          Container(
            width: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorConstants.primaryColorLight,
              borderRadius: getCustomBorderRadius(35),
              boxShadow: [getLightBoxShadow()]
            ), child: Column(
            children: [
              addText('Average Rating', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
              SizedBox(height: 1.h,),
              addText('4.3', getLargeTextFontSIze(), ColorConstants.black, FontWeight.bold),
              SizedBox(height: 1.h,),
              RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemSize: getLargeTextFontSIze()*1.7,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Image.asset('assets/images/star.png'),
                  onRatingUpdate: (rating) {
                    Get.log(rating.toString());
                  },
                )
              ],
          ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: BaseTabBar(tabController: controller.controller,tabList: [
              Tab(
                text: 'Management'.tr,
              ),
              Tab(
                text: 'Staff'.tr,
              ),
              Tab(
                text: 'Stars'.tr,
              ),
              Tab(
                text: 'Parents'.tr,
              ),
            ]),
          ),

          SizedBox(height: 2.h,),
          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: const [
                Management(),
                Staff(),
                Stars(),
                Parents()
              ],
            ),
          )


        ],
      ),
    );
  }


}