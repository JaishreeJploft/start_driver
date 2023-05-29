import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/trip_history_record_controller.dart';
import 'package:stardriver/app/modules/rating/star_rating_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/sos_app_header.dart';
import 'package:stardriver/common/utils.dart';

class TripHistoryRecordView extends GetView<TripHistoryRecordController>{
  const TripHistoryRecordView({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(TripHistoryRecordController());

    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: SOSAppHeader(
            showBackIcon: true,
            title: 'Records',
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.carouselController?.previousPage();
                    },
                    child: const Icon(Icons.arrow_back_ios,color: ColorConstants.primaryColor,),
                  ),
                  Expanded(
                    child: CarouselSlider.builder(
                      carouselController: controller.carouselController!,
                      disableGesture: true,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                          Container(
                            child: addText(
                                'Monday, 22/05/2022',
                                getNormalTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.bold),
                          ),
                      options: CarouselOptions(
                        height: getLargeTextFontSIze(),
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.carouselController?.nextPage();
                    },
                    child: const Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor ,),
                  ),

                  SizedBox(width: 5.w,),

                  GestureDetector(
                    onTap: (){
                      showPicker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: getBorderRadius(),
                          border: Border.all(color: ColorConstants.borderColor2,width: 2)
                      ),child: SvgPicture.asset('assets/images/fab_calendar.svg',height: getHeadingTextFontSIze(),),
                    ),
                  )

                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                boxShadow: [getBoxShadow()],
                borderRadius: getBorderRadius(),
                color: ColorConstants.white,
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: addText('Trip 1', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
                  buildDivider(),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/fab_calendar.svg',
                              height: getHeadingTextFontSIze()),
                          const SizedBox(width: 10,),
                          addText('01/03/2022', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.w500)
                        ],
                      ),
                      const Spacer(),


                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/ic_time.svg',
                              height: getHeadingTextFontSIze()),
                          const SizedBox(width: 10,),
                          addText('9:13 pm', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.w500)
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  buildDivider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/pin.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      addText('Location', getSmallTextFontSIze() + 1,
                          ColorConstants.black, FontWeight.normal),
                      Expanded(
                        child: addText(
                            ' : Liwa Tower P.O. Box 901 Abu Dhabi',
                            getSmallTextFontSIze() + 1,
                            ColorConstants.primaryColor,
                            FontWeight.bold),
                      ),
                    ],
                  ),
                  buildDivider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_time.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      addText('Planned Start Time', getSmallTextFontSIze() + 1,
                          ColorConstants.black, FontWeight.normal),
                      Expanded(
                        child: addText(
                            ' : 07:10am',
                            getSmallTextFontSIze() + 1,
                            ColorConstants.primaryColor,
                            FontWeight.bold),
                      ),
                    ],
                  ),
                  buildDivider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_time.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      addText('Planned End Time', getSmallTextFontSIze() + 1,
                          ColorConstants.black, FontWeight.normal),
                      Expanded(
                        child: addText(
                            ' : 09:30am',
                            getSmallTextFontSIze() + 1,
                            ColorConstants.primaryColor,
                            FontWeight.bold),
                      ),
                    ],
                  ),





                ],
              ),
            ),

            SizedBox(height: 1.h,),

            Stack(
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      boxShadow: [getBoxShadow()],
                      color: ColorConstants.white,
                      border: Border.all(color: ColorConstants.borderColor2)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                          border: Border.all(color: ColorConstants.primaryColor),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/ic_driver.svg',
                          height: getLargeTextFontSIze() * 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          buildInfoItems('Name', 'Rahish'),
                          buildInfoItems('ID', '#78656'),
                          buildInfoItems('Designation', 'Driver'),
                          buildInfoItems('Trip Start at', '7:15 am'),
                          buildColorInfoItems('Difference', '5 Minutes Early',Colors.green),
                          buildInfoItems('Trip End at', '9:25 am'),
                          buildColorInfoItems('Difference', '5 Minutes Late',Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                    right: 5,
                    top: 1,
                    bottom: 1,
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.busRating);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [getBoxShadow()],
                            color: ColorConstants.white
                        ),
                        child: SvgPicture.asset('assets/images/star.svg'),
                      ),
                    ))


              ],
            ),

            SizedBox(height: 2.h,),

            Stack(
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      boxShadow: [getBoxShadow()],
                      color: ColorConstants.white,
                      border: Border.all(color: ColorConstants.borderColor2)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: getCurvedBorderRadius(),
                          border: Border.all(color: ColorConstants.primaryColor),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/ic_supervisor.svg',
                          height: getLargeTextFontSIze() * 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          buildInfoItems('Name', 'Adil'),
                          buildInfoItems('ID', '#78436'),
                          buildInfoItems('Designation', 'Supervisor'),
                          buildInfoItems('Trip Start at', '7:15 am'),
                          buildColorInfoItems('Difference', '5 Minutes Early',Colors.green),
                          buildInfoItems('Trip End at', '9:25 am'),
                          buildColorInfoItems('Difference', '5 Minutes Late',Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                    right: 5,
                    top: 1,
                    bottom: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.supervisorRating);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [getBoxShadow()],
                            color: ColorConstants.white
                        ),
                        child: SvgPicture.asset('assets/images/star.svg'),
                      ),
                    ))


              ],
            ),

            SizedBox(height: 2.h,),

            Align(alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 20,bottom: 1.h),
                    child: addText('Located Bus', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold))),

            Stack(
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: getCurvedBorderRadius(),
                      boxShadow: [getBoxShadow()],
                      color: ColorConstants.white,
                      border: Border.all(color: ColorConstants.borderColor2)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/bus.svg',
                        height: getLargeTextFontSIze() * 2.5,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          buildInfoItems('Bus ID', '#29735'),
                          buildInfoItems('Bus Plate', '569835'),
                        ],
                      ),

                    ],
                  ),
                ),

                Positioned(
                    right: 5,
                    top: 1,
                    bottom: 1,
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.busRating);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [getBoxShadow()],
                            color: ColorConstants.white
                        ),
                        child: SvgPicture.asset('assets/images/star.svg'),
                      ),
                    ))


              ],
            ),

            SizedBox(height: 2.h,),

            Align(alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 20,bottom: 1.h),
                    child: addText('Passenger List', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold))),


            ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return buildPassengerItems(index);
              },
            ),



            SizedBox(height: 10.h,),



          ],
        ),
      ),
    );
  }


  Widget buildPassengerItems(int index){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
          borderRadius: getCurvedBorderRadius(),
          boxShadow: [getBoxShadow()],
          color: ColorConstants.white,
          border: Border.all(color: ColorConstants.borderColor2)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.primaryColor),
            ),
            child: SvgPicture.asset(
              'assets/images/student.svg',
              height: getLargeTextFontSIze() * 2,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              addText('Roma(Star)', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
              SizedBox(height: 1.h,),
              addText('#643576', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
              SizedBox(height: 1.h,),
              buildInfoItems('Pickup', '7:29 am'),
              buildInfoItems('Status', 'Online'),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              GestureDetector(
                onTap: (){
                  Get.dialog(StarRatingDialog());
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [getBoxShadow()],
                      color: ColorConstants.white
                  ),
                  child: SvgPicture.asset('assets/images/star.svg'),
                ),
              ),
              SizedBox(height: 1.h,),
              addText('09/03/2023', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
            ],
          ),

        ],
      ),
    );
  }

}