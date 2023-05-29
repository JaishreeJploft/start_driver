import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/bus_detail_controller.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AddRecordView extends GetView<BusDetailController> {
  const AddRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Add Maintenance Request',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      addText('Date', getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.w700),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            showPicker(context);
                          },
                          child: SvgPicture.asset(
                            'assets/images/fab_calendar.svg',
                            color: ColorConstants.black,
                            height: getHeadingTextFontSIze(),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 65.w,
                  decoration: getEditTextDecoration(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: addText(
                        controller.addRecordDate.value,
                        getNormalTextFontSIze(),
                        ColorConstants.gretTextColor,
                        FontWeight.normal),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            buildInputField('Title', controller.addRecordTitleController!),
            const SizedBox(
              height: 10,
            ),
            buildInputField('Description', controller.addRecordTitleController!,
                maxlines: 4, hintText: "Description"),
            const SizedBox(
              height: 10,
            ),
            buildInputField('Kilometer', controller.addRecordKmController!),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText('Upload\nDoc', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.w700),
                Container(
                  width: 65.w,
                  decoration: getEditTextDecoration(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: addText('Upload Doc', getNormalTextFontSIze(),
                            ColorConstants.gretTextColor, FontWeight.normal),
                      ),
                      SvgPicture.asset('assets/images/ic_upload.svg')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {},
              child: BorderedButton(
                width: 50.w,
                text: 'REQUEST',
              ),
            )
          ],
        ),
      ),
    );
  }
}
