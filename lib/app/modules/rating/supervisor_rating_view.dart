import 'package:get/get.dart';
import 'package:stardriver/app/controller/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class SupervisorRatingView extends GetView<RatingController> {
  const SupervisorRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Supervisor Rating',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.lightGreyColor),
                  borderRadius: getCurvedBorderRadius()),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.primaryColor),
                        borderRadius: getCurvedBorderRadius()),
                    child: SvgPicture.asset(
                      'assets/images/ic_supervisor.svg',
                      height: 7.h,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildInfoItems('Name', 'Adil'),
                      buildInfoItems('Designation', 'Supervisor'),
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
                  controller.isMinStaffRating.value = true;
                } else {
                  controller.isMinStaffRating.value = false;
                }
              },
            ),
            Obx(() => controller.isMinStaffRating.value
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
                  controller.staffTextEditingController!, 'Comment :'),
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
                      value: controller.isStaffAnonymousChecked.value,
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
                        controller.isStaffAnonymousChecked.value = value!;
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
}
