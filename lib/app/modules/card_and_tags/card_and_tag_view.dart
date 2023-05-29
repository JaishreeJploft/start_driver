import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/card_and_tag_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/custom_switch.dart';
import 'package:stardriver/common/utils.dart';

import '../../../common/show_qr_widget.dart';

class CardAndTagsView extends GetView<CardAndTagsController> {
  const CardAndTagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Cards & Tags',
          )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: getCurvedBorderRadius(),
                    border: Border.all(color: ColorConstants.borderColor2)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: getCurvedBorderRadius(),
                        border: Border.all(color: ColorConstants.primaryColor),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/ic_driver.svg',
                        height: getLargeTextFontSIze() * 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildInfoItems('Name', 'Rahish'),
                        buildInfoItems('ID', '#168435'),
                        buildInfoItems('Designation', 'Driver'),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showQrDialog();
                        },
                        child: SvgPicture.asset('assets/images/qrcode.svg'))
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              addText('Select Options :', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.requestCardTagsView);
                },
                child: buildOptionsWidget('Request Cards & Tags'),
              ),
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(
                onTap: () {
                  showProgramNFCDialogue(context);
                },
                child: buildOptionsWidget('Synchronise NFC to Cards & Tags'),
              ),
              SizedBox(
                height: 3.h,
              ),
              addText('Linked Card & Tag :', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              buildLinkedCards(context),
              SizedBox(
                height: 3.h,
              ),
              addText('Requests :', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              buildRequests(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLinkedCards(BuildContext context) {
    return ListView.builder(
      itemCount: controller.activatedLinksList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              boxShadow: [getBoxShadow()],
              borderRadius: getBorderRadius(),
              color: ColorConstants.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/ic_card.svg',
                height: getHeadingTextFontSIze(),
              ),
              const SizedBox(
                width: 10,
              ),
              addText('Card No', getSmallTextFontSIze() + 1,
                  ColorConstants.black, FontWeight.normal),
              addText(
                  ' : 4587 9857 4587 6521',
                  getSmallTextFontSIze() + 1,
                  ColorConstants.primaryColor,
                  FontWeight.bold),
              const Spacer(),
              addText('Off', getSmallTextFontSIze(), ColorConstants.black,
                  FontWeight.normal),
              const SizedBox(
                width: 5,
              ),
              Obx(() => CustomSwitch(
                    key: GlobalKey(),
                    value: controller.activatedLinksList[index],
                    enableColor: ColorConstants.primaryColorLight,
                    disableColor: ColorConstants.lightGreyColor,
                    width: 40,
                    height: 20,
                    switchHeight: 20,
                    switchWidth: 20,
                    onChanged: (bool value) {
                      controller.activatedLinksList[index] =
                          !controller.activatedLinksList[index];
                    },
                  )),
              const SizedBox(
                width: 5,
              ),
              addText('On', getSmallTextFontSIze(), ColorConstants.black,
                  FontWeight.normal),
            ],
          ),
        );
      },
    );
  }

  Widget buildRequests(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_card.svg',
                    height: getHeadingTextFontSIze(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      addText('Activation Card No', getSmallTextFontSIze() + 1,
                          ColorConstants.black, FontWeight.normal),
                      addText(
                          ' : 4587  9857  4587  6521',
                          getSmallTextFontSIze() + 1,
                          ColorConstants.primaryColor,
                          FontWeight.bold),
                    ],
                  ),
                ],
              ),
              buildDivider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_reason.svg',
                    height: getHeadingTextFontSIze(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  addText('Reason', getSmallTextFontSIze() + 1,
                      ColorConstants.black, FontWeight.normal),
                  Expanded(
                    child: addText(
                        ' : Lorem Ipsum is simply dummy text...',
                        getSmallTextFontSIze() + 1,
                        ColorConstants.primaryColor,
                        FontWeight.bold),
                  ),
                ],
              ),
              buildDivider(),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/ic_calendar.svg',
                          height: getHeadingTextFontSIze()),
                      const SizedBox(
                        width: 10,
                      ),
                      addText('01/03/2022', getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.w500)
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                      height: getHeadingTextFontSIze(),
                      child: VerticalDivider(
                        color: ColorConstants.borderColor2.withOpacity(0.5),
                        thickness: 2,
                      )),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_time.svg',
                        height: getHeadingTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      addText('09:13pm', getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.w500)
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              buildDivider(),
              StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: controller.curStep,
                  color: ColorConstants.primaryColor,
                  statuses: controller.statuses,
                  titles: controller.dates),
            ],
          ),
        );
      },
    );
  }

  Widget buildOptionsWidget(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.primaryColor),
          color: ColorConstants.white,
          borderRadius: getBorderRadius()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          addText(title, getNormalTextFontSIze(), ColorConstants.primaryColor,
              FontWeight.normal),
          const Icon(
            Icons.arrow_forward_rounded,
            color: ColorConstants.primaryColor,
          )
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: ColorConstants.borderColor2.withOpacity(0.5),
      thickness: 2,
      height: 3.h,
    );
  }
}
