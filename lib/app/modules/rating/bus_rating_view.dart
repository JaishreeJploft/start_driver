import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/rating_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class BusRatingView extends GetView<RatingController> {
  const BusRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Bus Rating',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: getBorderRadius(),
                  border: Border.all(color: ColorConstants.borderColor),
                  color: ColorConstants.primaryColorLight),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: buildDropDown(
                controller.busItems,
                controller.selectedbus,
                'Hint',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.lightGreyColor),
                  borderRadius: getCurvedBorderRadius()),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.primaryColor),
                        borderRadius: getCurvedBorderRadius()),
                    child: SvgPicture.asset('assets/images/ic_bus.svg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildInfoItems('Bus ID', '#29735'),
                      buildInfoItems('Bus Plate', '56981'),
                      buildInfoItems('School ID', '#s41568'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: getLargeTextFontSIze() * 2,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) =>
                  Image.asset('assets/images/star.png'),
              onRatingUpdate: (rating) {
                Get.log(rating.toString());
                if (rating == 1) {
                  controller.isMinBusRating.value = true;
                } else {
                  controller.isMinBusRating.value = false;
                }
              },
            ),
            Obx(() => controller.isMinBusRating.value
                ? addText(
                    'Note - Comment is mandatory if you rate minimum',
                    getSmallTextFontSIze(),
                    ColorConstants.lightTextColor,
                    FontWeight.normal)
                : const SizedBox.shrink()),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: getEditTextDecoration(),
              child: buildLineEditText(
                  controller.busTextEditingController!, 'Comment :'),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(() => Checkbox(
                      checkColor: ColorConstants.primaryColor,
                      activeColor: ColorConstants.primaryColorLight,
                      value: controller.isBusAnonymousChecked.value,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                          width: 1.0,
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (bool? value) {
                        controller.isBusAnonymousChecked.value = value!;
                      },
                    )),
                Expanded(
                    child: addText(
                        'Do you want to remain anonymous?',
                        getHeadingTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.w500))
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () {},
              child: CircularBorderedButton(
                width: 30.w,
                text: 'SUBMIT',
                capFirst: false,
              ),
            )
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
            selectedItemBuilder: (BuildContext context) {
              return list.map<Widget>((item) {
                return Row(
                  children: [
                    addText('Bus ID : ', getSmallTextFontSIze() + 1,
                        ColorConstants.black, FontWeight.normal),
                    addText('# $item', getSmallTextFontSIze() + 1,
                        ColorConstants.primaryColor, FontWeight.bold),
                  ],
                );
              }).toList();
            },
          )),
    );
  }
}
