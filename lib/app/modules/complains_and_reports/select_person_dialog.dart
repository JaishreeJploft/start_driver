import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/raise_complain_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class SelectPersonDialog extends GetView<RaiseComplainController> {
  const SelectPersonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          constraints: BoxConstraints(maxHeight: 80.h),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCurvedBorderRadius(),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    color: ColorConstants.borderColor,
                  ),
                ),
              ),
              addText('Select Person', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: getEditTextDecoration(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/teacher.svg',
                            height: getHeadingTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: buildDropDown(controller.roleList,
                                  controller.selectedRole, 'Select Role'))
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                      color: ColorConstants.borderColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: ColorConstants.borderColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: ColorConstants.primaryColor,
                              keyboardType: TextInputType.multiline,
                              controller: controller.selectPersonController!,
                              textInputAction: TextInputAction.next,
                              style:
                                  TextStyle(fontSize: getNormalTextFontSIze()),
                              decoration: InputDecoration(
                                  hintText: 'Search By ID/Name...'.tr,
                                  isDense: true,
                                  hintStyle: TextStyle(
                                      fontSize: getNormalTextFontSIze(),
                                      color: ColorConstants.borderColor),
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                    ),
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
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstants.borderColor2, width: 1),
                          borderRadius: getBorderRadius(),
                          color: index.isOdd
                              ? ColorConstants.white
                              : ColorConstants.primaryColorLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorConstants.primaryColor,
                                    width: 1),
                                borderRadius: getBorderRadius(),
                                color: ColorConstants.white),
                            child: SvgPicture.asset(
                              'assets/images/user.svg',
                              height: getLargeTextFontSIze() * 1.5,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('Roma(Star)', getNormalTextFontSIze(),
                                  ColorConstants.black, FontWeight.bold),
                              addText('#646537', getNormalTextFontSIze(),
                                  ColorConstants.primaryColor, FontWeight.w500),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.white, width: 2),
                                  shape: BoxShape.circle,
                                  boxShadow: [getDeepBoxShadow()],
                                  color: index.isEven
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.borderColor2),
                              child: Icon(
                                Icons.check,
                                color: ColorConstants.white,
                                size: getSubheadingTextFontSIze(),
                              ),
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
              )),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {},
                child: CircularBorderedButton(width: 40.w, text: 'SAVE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropDown(List<String> list, RxString selectedValue, String hint) {
    return DropdownButtonHideUnderline(
      child: Obx(() => DropdownButton2(
            isDense: true,
            buttonPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
            icon: const Icon(
              Icons.arrow_drop_down,
              color: ColorConstants.lightGreyColor,
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
}
