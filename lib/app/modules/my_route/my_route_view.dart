
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/my_route_controller.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../routes/app_routes.dart';

class MyRoute extends GetView<MyRouteController> {
  const MyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(7.h),
    child: AppHeader(
    showBackIcon: true,
    title: 'Route',
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                      itemBuilder: (context, index)=> card(title: 'Route No. ${index+1}', index: 0)),
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
     onTap: () => Get.toNamed(Routes.myRouteDescriptionView),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0XA59F9F),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0XFFBECADA),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText(
                            title,
                            16,
                            const Color(0xff030303),
                            FontWeight.bold,
                          ),
                          const SizedBox(height: 2),
                          richTile(
                            title: 'Start Destination',
                            value: 'Hypermarket',
                          ),
                          const SizedBox(height: 2),
                          richTile(
                            title: 'End Destination',
                            value: 'UAE School',
                          ),
                          const SizedBox(height: 2),
                          richTile(
                            title: 'Stoppage',
                            value: '11',
                          ),
                          const SizedBox(height: 2),
                          richTile(
                            title: 'Bus ID',
                            value: '#245651',
                          ),
                          const SizedBox(height: 2),
                          richTile(
                            title: 'Driver',
                            value: 'Rafiq Khan ',
                          ),
                          const SizedBox(height: 2),
                          richTile(
                            title: 'Supervisor',
                            value: 'Salma Khan',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.tripRouteView);
                            },
                              child: SvgPicture.asset('assets/images/ic_map.svg'))
                        ],
                      ),
                    )


                  ],
                ),
              ],
            ),
          ),
        ),
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
}
