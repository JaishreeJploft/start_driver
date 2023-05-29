import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/attendance_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AttendancePresent extends GetView<AttendanceController> {
  const AttendancePresent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildPresentItem(index, context);
        },
      ),
    );
  }

  Widget buildPresentItem(int index, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: ColorConstants.white,
          boxShadow: [getBoxShadow()],
          borderRadius: getBorderRadius()),
      child: ClipRRect(
        borderRadius: getBorderRadius(),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/ic_calendar.svg',
                              height: getNormalTextFontSIze(),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            addText('01/03/2023', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.normal),
                            SizedBox(
                              width: 15.w,
                            ),
                            SvgPicture.asset(
                              'assets/images/ic_time.svg',
                              height: getNormalTextFontSIze(),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            addText('01/03/2023', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.normal)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                         width: 50.w,
                          height: 0.5,
                          color: ColorConstants.borderColor2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ic_school.svg',
                              height: getNormalTextFontSIze(),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            addText('School : ', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.normal),
                            addText('UAE Public School', getSmallTextFontSIze() + 1,
                                ColorConstants.primaryColor, FontWeight.bold),
                          ],
                        ),
                        const SizedBox(height: 15,),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(

                  color: ColorConstants.lightGreen,
                  child: Center(
                    child: addText('Present', getNormalTextFontSIze(),
                        ColorConstants.green, FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
