import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/star_detail_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class MainLocation extends GetView<StarDetailController>{
  const MainLocation({super.key,this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText(title ?? 'Location', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
            SizedBox(height: 1.h,),
            Row(
              children: [
                SvgPicture.asset('assets/images/pin.svg',height: getHeadingTextFontSIze(),),
                const SizedBox(width: 5,),
                addText('Location', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                addText(' : Lia Tower P.O. Box 901 Abu Dhabi', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)
              ],
            ),
            SizedBox(height: 2.h,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                borderRadius: getCurvedBorderRadius(),
                boxShadow: [getBoxShadow()],
                color: ColorConstants.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: 100.w,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.primaryColor)
                    ), child: SvgPicture.asset('assets/images/house.svg'),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.primaryColor),
                              borderRadius: getCurvedBorderRadius(),
                              color: ColorConstants.white),
                          child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*1.3,),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            buildInfoItems('Guardian', 'Salim Khan'),
                            buildInfoItems('Relation', 'Father'),


                          ],
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.messageView);
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/ic_chat.svg'),
                              const SizedBox(height: 5,),
                              addText('Chat', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)
                            ],
                          ),
                        ),

                        SizedBox(width: 5.w,),

                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.tripDirectionView);
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/ic_map.svg'),
                              const SizedBox(height: 5,),
                              addText('Direction', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)
                            ],
                          ),
                        ),




                      ],
                    ),
                  ),
                  Divider(
                    height: 3.h,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        buildInfoItems('Sector', 'Dubai'),
                        buildInfoItems('Area', 'Jumeriah'),
                        buildInfoItems('Street', '53 B'),
                        buildInfoItems('Building/Villa', 'KM Tower'),
                        buildInfoItems('Flat/Villa No', '123456'),
                        buildInfoItems('Landmark', 'Jumeriah'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoItems('Mobile No', '0503664321  '),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    const ClipboardData(text: "0503664321"));
                                showToast('Number copied to clipboard');
                              },
                              child: Icon(
                                Icons.copy,
                                color: ColorConstants.primaryColor,
                                size: getHeadingTextFontSIze(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoItems('Landline No', 'L043674882  '),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    const ClipboardData(text: "0503664321"));
                                showToast('Number copied to clipboard');
                              },
                              child: Icon(
                                Icons.copy,
                                color: ColorConstants.primaryColor,
                                size: getHeadingTextFontSIze(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.h,)

                      ],
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 4.h,),
            addText('Guardians', getHeadingTextFontSIze(), ColorConstants.black, FontWeight.bold),
            SizedBox(height: 1.h,),
            buildGuardianList()

          ],
        ),
      ),
    );
  }

  Widget buildGuardianList(){
    return ListView.builder(
      itemCount: 12,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              boxShadow: [getBoxShadow()],
              color: ColorConstants.white
            ),
            child: IntrinsicHeight(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 15.w,
                    width: 15.w,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.primaryColor),
                        borderRadius: getCustomBorderRadius(15),
                        color: ColorConstants.white),
                    child: SvgPicture.asset('assets/images/user.svg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                 Expanded(child:  Padding(
                   padding: const EdgeInsets.symmetric(vertical: 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       buildInfoItems('Guardian', 'Salim Khan'),
                       buildInfoItems('Relation', 'Father'),
                       buildInfoItems('Mobile No', '41654368465'),
                       buildInfoItems('Emergency No', '41853684965'),


                     ],
                   ),
                 ),),



                  GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.messageView);
                    },
                    child: Container(
                      width: 20.w,
                      decoration:  BoxDecoration(
                        color: ColorConstants.lightGreyColor.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/ic_chat.svg'),
                          const SizedBox(height: 5,),
                          addText('Chat', getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal)
                        ],
                      ),
                    ),
                  ),






                ],
              ),
            ),
          ),
        );
      },
    );
  }

}