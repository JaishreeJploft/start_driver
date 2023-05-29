import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/annual_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class AnnualSchedule extends StatelessWidget {
  const AnnualSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Annual Schedule',
          )),
      body: GetBuilder<AnnualController>(builder: (controller) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: ColorConstants.borderColor),
                  color: ColorConstants.primaryColorLight),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: buildSchoolDropDown(controller),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: annualLists.length,
                itemBuilder: (BuildContext context, int index) {
                  final model = annualLists[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.annualScheduledetail);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 13, right: 13),
                      decoration: BoxDecoration(
                          color: model.color,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              model.image,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText(model.title, getHeadingTextFontSIze(),
                                  ColorConstants.black, FontWeight.bold),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(model.date,
                                    style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getNormalTextFontSIze(),
                                      color: ColorConstants.black,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildSchoolDropDown(AnnualController controller) {
    return Center(
      child: Obx(() => SizedBox(
            height: 30,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: controller.schoolItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: getNormalTextFontSIze(),
                              fontWeight: FontWeight.normal,
                              color: ColorConstants.gretTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: controller.selectedSchool.value,
                onChanged: (value) {
                  controller.selectedSchool.value = value.toString();
                },
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: getLargeTextFontSIze() * 1.5,
                  color: ColorConstants.lightTextColor,
                ),
                iconSize: 14,
                iconEnabledColor: ColorConstants.gretTextColor,
                iconDisabledColor: Colors.grey,
                buttonWidth: 80.w,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 78.w,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
                dropdownElevation: 1,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                // offset: const Offset(-20, 0),
              ),
            ),
          )),
    );
  }
}

class AnnualScheduleModel {
  final String title;
  final String date;
  final String image;
  final Color color;
  AnnualScheduleModel(
      {required this.title,
      required this.date,
      required this.image,
      required this.color});
}

List<AnnualScheduleModel> annualLists = [
  AnnualScheduleModel(
      title: "Summer Vacations",
      date: "June 15 to July 15 ",
      image: "assets/images/ic_summer.svg",
      color: ColorConstants.green2),
  AnnualScheduleModel(
      title: "Winter Vacations",
      date: "January 10 to February 10",
      color: ColorConstants.blue2,
      image: "assets/images/ic_winter.svg"),
  AnnualScheduleModel(
      title: "New Year’s Day",
      date: "January 1",
      color: ColorConstants.blue2,
      image: "assets/images/ic_new.svg"),
  AnnualScheduleModel(
      title: "Eid al Fitr",
      color: ColorConstants.green2,
      date: "April 20, 21, 22 and 23",
      image: "assets/images/ic_eid.svg"),
  AnnualScheduleModel(
      title: "Arafat Day",
      color: ColorConstants.yellow2,
      date: "June 27",
      image: "assets/images/ic_arafat.svg"),
  AnnualScheduleModel(
      title: "June 28, 29, 30",
      date: "Eid al Adha",
      color: ColorConstants.yellow2,
      image: "assets/images/ic_eid.svg"),
  AnnualScheduleModel(
      title: "July 19",
      color: ColorConstants.blue2,
      date: "Islamic New Year",
      image: "assets/images/ic_eid_yellow.svg"),
  AnnualScheduleModel(
      title: "September 27",
      color: ColorConstants.green2,
      date: "The Prophet Muhammad’s (PBUH) birthday",
      image: "assets/images/ic_cake.svg"),
  AnnualScheduleModel(
      title: "December 1",
      color: ColorConstants.yellow2,
      date: "Commemoration Day",
      image: "assets/images/ic_commence.svg"),
  AnnualScheduleModel(
      title: "December 2, 3",
      date: "National Day",
      color: ColorConstants.yellow2,
      image: "assets/images/ic_flag.svg"),
];
