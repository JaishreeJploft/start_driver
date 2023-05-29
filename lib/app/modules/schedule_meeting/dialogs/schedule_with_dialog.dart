import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/schedule_meeting_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ScheduleWithDialog extends GetView<ScheduleMeetingController>{
  const ScheduleWithDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10,),
                  addText('Schedule With', getSubheadingTextFontSIze(),
                      ColorConstants.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: ColorConstants.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    border: Border.all(color: ColorConstants.borderColor2)
                ), child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      SvgPicture.asset('assets/images/ic_teacher.svg',height: getHeadingTextFontSIze(),),
                      const SizedBox(width: 10,),
                      Expanded(child: buildSchoolDropDown())
                    ],
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Icon(Icons.search,size: getHeadingTextFontSIze(),),
                      const SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: addText('Search Star,ID', getNormalTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 16,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
                      child:  Container(

                        margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.borderColor2,width: 1),
                            borderRadius: getBorderRadius(),
                            color: index.isOdd? ColorConstants.white : ColorConstants.primaryColorLight),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorConstants.primaryColor,width: 1),
                                  borderRadius: getBorderRadius(),
                                  color: ColorConstants.white),
                              child: SvgPicture.asset('assets/images/ic_driver.svg',height: getLargeTextFontSIze()*1.5,),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addText('Roma(Star)', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                                addText('#646537', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w500),
                              ],
                            ),

                            const Spacer(),

                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorConstants.white,width: 2),
                                    shape: BoxShape.circle,
                                    boxShadow: [getDeepBoxShadow()],
                                    color: index.isEven ? ColorConstants.primaryColor : ColorConstants.borderColor2
                                ), child: Icon(Icons.check,color: ColorConstants.white,size: getSubheadingTextFontSIze(),),
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),


                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              SizedBox(
                height: 2.h,
              ),

              GestureDetector(
                onTap: () {},
                child: CircularBorderedButton(width: 40.w, text: 'SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
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
          buttonWidth: double.infinity,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 78.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: const Offset(-20, 0),
        ),
      )),
    );
  }

}