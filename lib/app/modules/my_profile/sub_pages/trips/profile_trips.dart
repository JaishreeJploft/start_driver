import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/my_profile_controller.dart';
import 'package:stardriver/app/modules/star_details/main_location.dart';
import 'package:stardriver/app/modules/trip_location_page.dart';
import 'package:stardriver/app/modules/trip_operation/sub_pages/trip_direction_view.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ProfileTrips extends GetView<MyProfileController>{
  const ProfileTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Number of located schools: ".tr,
                      style: TextStyle(
                        fontFamily: 'Ariel',
                        fontSize: getNormalTextFontSIze(),
                        color: ColorConstants.black,
                        fontWeight: FontWeight.w500,
                      )),
                  TextSpan(
                    text: "5".tr,
                    style: TextStyle(
                      fontFamily: 'Ariel',
                      fontSize: getNormalTextFontSIze(),
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: buildTripItem(index,context));
              },
            ),
            
          ],
        ),
      ),
    );
  }


  Widget buildTripItem(int index,BuildContext context){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: ColorConstants.primaryColor,
              collapsedIconColor: ColorConstants.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: addText(
                  'Ignite Group School',
                  getHeadingTextFontSIze(),
                  ColorConstants.black,
                  FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[

                buildInfoItems('School Name' , 'Ignite Group School'),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                buildInfoItems('Staff Admin' , 'Ahmed Ali (Bus Admin)'),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                buildInfoItems('Driver/Supervisor' , 'Dusyant Ali'),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                        child: buildInfoItems('School Address' , "located in Al Warqa'a 3")),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(onTap: (){
                        Get.to(const TripDirectionView());
                      },child: Align(alignment: Alignment.centerRight,child: SvgPicture.asset('assets/images/ic_map.svg'))),
                    )
                  ],
                ),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                SizedBox(height: 2.h,),
                buildTripInfoWidget('Week Days - 5', 'ic_calendar', 'Monday, Tuesday, Wednesday'),
                buildTripInfoWidget('Total Passenger', 'passengers', '20'),
                buildTripInfoWidget('Total Stops', 'stop', '10'),
                buildTripInfoWidget('Trip Time', 'ic_time', '7:15 AM to 9:15 AM'),
                Align(
                  alignment: Alignment.topLeft,
                  child: addText('Located Bus', getNormalTextFontSIze(), ColorConstants.black,
                      FontWeight.bold),
                ),
                SizedBox(height: 1.h,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.busDetailView);
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        margin: const EdgeInsets.only(right:0),
                        decoration: BoxDecoration(
                            borderRadius: getCurvedBorderRadius(),
                            border: Border.all(color: ColorConstants.borderColor2)
                        ), child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          SvgPicture.asset('assets/images/bus.svg'),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildInfoItems('Bus School Id' ,'#29735'),
                              buildInfoItems('Bus Plate' ,'569815')
                            ],
                          )

                        ],
                      ),
                      ),
                      Positioned(
                        right: -10,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.busRating);
                          }, child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorConstants.borderColor2),
                              // boxShadow: [getDeepBoxShadow()],
                              color: ColorConstants.white
                          ),
                          child: SvgPicture.asset('assets/images/star.svg'),
                        ),
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(height: 2.h,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Route', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.tripRouteView);
                      },
                      child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,),
                    )

                  ],
                ),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Trip Details', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.tripDetailView);
                      },
                      child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,),
                    )

                  ],
                ),


                SizedBox(height: 2.h,),







              ]),
        ),
      ),
    );
  }

  Widget buildTripInfoWidget(String heading,String image,String details){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addText(heading, getNormalTextFontSIze(), ColorConstants.black,
            FontWeight.bold),
        SizedBox(height: 1.h,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(borderRadius: getBorderRadius(),
              border: Border.all(color: ColorConstants.primaryColor),
              color: ColorConstants.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SvgPicture.asset('assets/images/$image.svg',height: 20,),
              const SizedBox(width: 10,),
              Expanded(child: addText(details, getNormalTextFontSIze(), ColorConstants.primaryColor,
                  FontWeight.normal)),


            ],
          ),
        ),
        SizedBox(height: 2.h,),
      ],
    );
  }


}