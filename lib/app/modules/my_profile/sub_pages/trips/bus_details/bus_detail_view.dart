import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/bus_detail_controller.dart';
import 'package:stardriver/app/modules/my_profile/sub_pages/trips/bus_details/sub_pages/maintenance_view.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_fab.dart';
import 'package:stardriver/common/utils.dart';

class BusDetailView extends GetView<BusDetailController> {
  const BusDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Bus Details',
          )),
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Request',icon: Icons.add,onButtonClicked: (){
        Get.toNamed(Routes.addRecordView);
      },),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    border: Border.all(color: ColorConstants.borderColor2),
                    borderRadius: getCurvedBorderRadius()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/bus.svg'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoItems('Bus Plate', '569815'),
                        buildInfoItems('Bus School ID', '5487547'),
                        buildInfoItems('Driver', 'Amir Saikh'),
                        buildInfoItems('Mobile No', '5632478945'),
                        buildInfoItems('Supervisor', 'Ali Khan'),
                        buildInfoItems('Mobile No', '5632478945'),
                        buildInfoItems('Bus Company', 'Toyota'),
                      ],
                    ),

                  ],
                ),
              ),

              Positioned(right: 5,
                bottom: 0,
                top: 0,
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.busRating);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [getDeepBoxShadow()],
                        color: ColorConstants.white
                    ),
                    child: SvgPicture.asset('assets/images/star.svg',height: getHeadingTextFontSIze()+1,),
                  ),
                ),)


            ],
          ),
          SizedBox(height: 2.h,),
          buildTabBar(),
          SizedBox(height : 2.h),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.controller,
              children:  [
                MaintenanceView(type: 0,),
                MaintenanceView(type: 1,),
              ],
            ),
          ),


          SizedBox(height : 2.h),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          // color: const Color(0xFFEEEEEE),
          borderRadius: getBorderRadius()
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Obx(() => GestureDetector(
            onTap: (){
              controller.controller.index = 0;
              controller.selectedPos.value = 1;
            },
            child: Container(
              width: 42.w,
              padding: EdgeInsets.symmetric(vertical: 1.h),
              decoration: controller.selectedPos.value == 1 ? getPrimaryDecoration() : getEditTextDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: addText('Maintenance', getSubheadingTextFontSIze(),
                      controller.selectedPos.value == 1 ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.w500),
                ),
              ),
            ),
          )),

         Obx(() =>  GestureDetector(
           onTap: (){
             controller.controller.index = 1;
             controller.selectedPos.value = 2;
           },
           child: Container(
             width: 42.w,
             padding: EdgeInsets.symmetric(vertical: 1.h),
             decoration: controller.selectedPos.value == 2 ? getPrimaryDecoration() : getEditTextDecoration(),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Center(
                 child: addText('Week Record', getSubheadingTextFontSIze(),
                     controller.selectedPos.value == 2 ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.w500),
               ),
             ),
           ),
         )),



          
        ],
      ),
    );
  }




}
