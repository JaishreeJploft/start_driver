import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/my_route_controller.dart';
import '../../routes/app_routes.dart';

class MyRouteDescriptionView extends GetView<MyRouteController> {
  const MyRouteDescriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Route Description',
          )),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: getBorderRadius(),
                        border: Border.all(color: ColorConstants.borderColor),
                        color: ColorConstants.primaryColorLight),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: buildDropDown(
                      controller.schoolItems,
                      controller.selectedSchool,
                      'Hint',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  const SizedBox(height: 10),
                  card(title: 'Route No. 1', index: 0),
                  const SizedBox(height: 50),

                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: 4,
                  //     itemBuilder: (context, index)=> card(title: 'Route No. ${index+1}', index: 0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildDropDown(List<String> list, RxString selectedValue, String hint) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2(
        buttonPadding: const EdgeInsets.symmetric(horizontal: 0),
        hint: Text(
          hint.tr,
          style: TextStyle(
              fontSize: getNormalTextFontSIze(),
              color: ColorConstants.gretTextColor),
        ),
        items: list
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: getNormalTextFontSIze(),
            ),
          ),
        ))
            .toList(),
        value: selectedValue.value.isNotEmpty ? selectedValue.value : null,
        onChanged: (value) {
          selectedValue.value = value as String;
        },
        iconSize: 30,
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          size: getLargeTextFontSIze() * 1.5,
          color: ColorConstants.lightTextColor,
        ),
        buttonWidth: 100.w,
        dropdownElevation: 1,
        dropdownDecoration: BoxDecoration(
          color: ColorConstants.white,
          boxShadow: [getDeepBoxShadow()],
        ),
      )),
    );
  }

  Widget card({required String title, required int index})  {
    return GestureDetector(
      //  onTap: () => Get.toNamed(Routes.myRouteDescriptionView),
        child:
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                boxShadow: [getBoxShadow()],
                borderRadius: getBorderRadius(),
                color: ColorConstants.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: addText(
                            'Start Destination',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold),
                      ),

                    ],
                  ),
                  SizedBox(height: 23,),
                  buildLongReason('ic_complaints', 'Area', 'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite'),
                  buildDivider(),
                  buildLongReason('ic_complaints', 'Sector', 'Dubai - United Arab Emirates'),
                  buildDivider(),
                  buildLongReason(
                      'ic_message', 'Address', 'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite'),
                  SizedBox(height: 23,),
                  Row(
                    children: [
                      Expanded(
                        child: addText(
                            'Add Stoppage',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold),
                      ),

                    ],
                  ),
                  SizedBox(height: 23,),
                  buildLongReason('ic_complaints', 'Area', 'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite'),
                  buildDivider(),
                  buildLongReason('ic_complaints', 'Sector', 'Dubai - United Arab Emirates'),
                  buildDivider(),
                  buildLongReason(
                      'ic_message', 'Address', 'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite'),
                  SizedBox(height: 23,),
                  Row(
                    children: [
                      Expanded(
                        child: addText(
                            'End Destination',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold),
                      ),

                    ],
                  ),
                  SizedBox(height: 23,),
                  buildLongReason('ic_complaints', 'Area', 'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite'),
                  buildDivider(),
                  buildLongReason('ic_complaints', 'Sector', 'Dubai - United Arab Emirates'),
                  buildDivider(),
                  buildLongReason(
                      'ic_message', 'Address', 'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite'),
                  SizedBox(height: 23,),
                  Row(
                    children: [
                      Expanded(
                        child: addText(
                            'Route Number',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold),
                      ),

                    ],
                  ),
                  SizedBox(height: 23,),
                  buildLongReason('ic_complaints', 'Route Number', '550'),
                  buildDivider(),
                  buildLongReason('ic_bus', 'Bus ID', '#145254825'),
                  buildDivider(),
                  buildLongReason(
                      'ic_driver', 'Driver', 'Rafiq Khan'),
                  buildDivider(),
                  buildLongReason(
                      'ic_supervisor', 'Supervisor', 'Rafiq Khan '),
                  SizedBox(height: 23,),
                ],
              ),
            ),
            if (index == 2)
              SizedBox(
                height: 15.h,
              )
          ],
        )
    );
  }
  richTile({required String title, required String value}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Color(0XFF4C4C4C),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
  buildLongReason(String image, String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/$image.svg',
          height: getHeadingTextFontSIze(),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                  style: TextStyle(fontSize: 14.5.sp),
                  children: [

                    TextSpan(
                        text: "$title : ",
                        style: const TextStyle(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.normal,
                        )
                    ),
                    TextSpan(
                        text: description,
                        style: const TextStyle(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        )
                    )
                  ]
              )
          ),
        ),
      ],
    );
    //   Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SvgPicture.asset(
    //       'assets/images/$image.svg',
    //       height: getHeadingTextFontSIze(),
    //     ),
    //     const SizedBox(
    //       width: 10,
    //     ),
    //     addText(title, getSmallTextFontSIze() + 1, ColorConstants.black,
    //         FontWeight.normal),
    //     Expanded(
    //       child: addText(' : $description', getSmallTextFontSIze() + 1,
    //           ColorConstants.primaryColor, FontWeight.bold),
    //     ),
    //   ],
    // );
  }
}
