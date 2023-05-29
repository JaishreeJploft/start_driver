import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/remaining_controller.dart';
import 'package:stardriver/app/modules/rating/star_rating_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class Remaining extends GetView<RemainingController> {
  const Remaining({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText('Passenger', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.bold),
                addText('18 of 20', getNormalTextFontSIze(),
                    ColorConstants.borderColor, FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            height: 5.h,
            child: ListView.builder(
              itemCount: controller.optionsImageList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    controller.selectedPos.value = index;
                  },
                  child: Obx(
                    () => Container(
                      width: 30.w,
                      margin:
                          EdgeInsets.symmetric(horizontal: 1.w, vertical: 2),
                      decoration: BoxDecoration(
                          color: controller.selectedPos.value == index
                              ? ColorConstants.primaryColorLight
                              : ColorConstants.white,
                          boxShadow: [getBoxShadow()],
                          borderRadius: getBorderRadius()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [getDeepBoxShadow()],
                                color: controller.selectedPos.value == index
                                    ? ColorConstants.primaryColor
                                    : ColorConstants.borderColor2),
                            child: Icon(
                              Icons.check,
                              color: ColorConstants.white,
                              size: getNormalTextFontSIze(),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            child: SvgPicture.asset(
                              controller.optionsImageList[index],
                              color: controller.selectedPos.value == index
                                  ? ColorConstants.primaryColor
                                  : ColorConstants.black,
                              height: getLargeTextFontSIze(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return index == 0
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.starDetailView);
                      },
                      child: buildOnTime(context, index),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.starDetailView);
                      },
                      child: buildOtherStatus(context, index),
                    );
            },
          ))
        ],
      ),
    );
  }

  Widget buildOnTime(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: ColorConstants.white,
              boxShadow: [getBoxShadow()],
              borderRadius: getCurvedBorderRadius()),
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getCustomBorderRadius(15)),
                        padding: EdgeInsets.all(1.2.h),
                        child: SvgPicture.asset(
                          'assets/images/student.svg',
                          width: 8.h,
                          height: 8.h,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      addText('Sania #21', getNormalTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.bold),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addText('Status', getSmallTextFontSIze() + 1,
                              ColorConstants.black, FontWeight.normal),
                          addText(' : Ontime', getSmallTextFontSIze() + 1,
                              ColorConstants.primaryColor, FontWeight.bold),
                          const Spacer()
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems('Guardian', 'Salim Khan'),
                      buildInfoItems('Relation', 'Father'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildInfoItems('Mobile No', '0503664321'),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(
                                  const ClipboardData(text: "0503664321"));
                              showToast('Number copied to clipboard');
                            },
                            child: Icon(
                              Icons.copy,
                              color: ColorConstants.primaryColor,
                              size: getHeadingTextFontSIze(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              changeStatusDialog();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: getPrimaryDecoration2(),
                              child: addText(
                                  'Edit'.toUpperCase(),
                                  getSmallestTextFontSIze() + 2,
                                  ColorConstants.black,
                                  FontWeight.normal),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              notifyDialog();
                            },
                            child: buildSubItems('ic_notify', 'Notify'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.tripDirectionView);
                            },
                            child: buildSubItems('ic_map', 'Map'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.messageView);
                            },
                            child: buildSubItems('ic_chat', 'Chat'),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            left: 5,
            child: GestureDetector(
              onTap: () {
                Get.dialog(StarRatingDialog());
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [getDeepBoxShadow()],
                    color: ColorConstants.white),
                child: SvgPicture.asset('assets/images/star.svg'),
              ),
            ))
      ],
    );
  }

  Widget buildOtherStatus(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: ColorConstants.white,
              boxShadow: [getBoxShadow()],
              borderRadius: getCurvedBorderRadius()),
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.primaryColor),
                            borderRadius: getCustomBorderRadius(15)),
                        padding: EdgeInsets.all(1.h),
                        child: SvgPicture.asset(
                          'assets/images/student.svg',
                          width: 6.h,
                          height: 6.h,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText('Sania #21', getNormalTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.bold),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          addText('Status', getSmallTextFontSIze() + 1,
                              ColorConstants.black, FontWeight.normal),
                          addText(' : Ontime', getSmallTextFontSIze() + 1,
                              ColorConstants.primaryColor, FontWeight.bold),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          changeStatusDialog();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: getPrimaryDecoration2(),
                          child: addText(
                              'Edit'.toUpperCase(),
                              getSmallestTextFontSIze() + 2,
                              ColorConstants.black,
                              FontWeight.normal),
                        ),
                      ),
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.tripDirectionView);
                        },
                        child: buildSubItems('ic_map', 'Map'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.messageView);
                        },
                        child: buildSubItems('ic_chat', 'Chat'),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            left: 5,
            child: GestureDetector(
              onTap: () {
                Get.dialog(StarRatingDialog());
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [getDeepBoxShadow()],
                    color: ColorConstants.white),
                child: SvgPicture.asset('assets/images/star.svg'),
              ),
            ))
      ],
    );
  }

  Widget buildSubItems(String image, String name) {
    return Column(
      children: [
        SvgPicture.asset('assets/images/$image.svg'),
        const SizedBox(
          height: 5,
        ),
        addText(name, getSmallTextFontSIze(), ColorConstants.black,
            FontWeight.normal)
      ],
    );
  }

  void changeStatusDialog() {
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
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
              addText('Change Status', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              buildInfoItems('Name', 'Sania Khan'),
              buildInfoItems('Current Status', 'Remaining for Pickup'),
              ListView.builder(
                itemCount: controller.statusList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedStatusPos.value = index;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstants.primaryColor, width: 1),
                          borderRadius: getBorderRadius(),
                          color: ColorConstants.white),
                      child: Row(
                        children: [
                          Expanded(
                              child: addText(
                                  controller.statusList[index],
                                  getNormalTextFontSIze(),
                                  ColorConstants.primaryColor,
                                  FontWeight.w500)),
                          Obx(() => Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.white, width: 0),
                                    shape: BoxShape.circle,
                                    boxShadow: [getDeepBoxShadow()],
                                    color: controller.selectedStatusPos.value ==
                                            index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.borderColor2),
                                child:
                                    controller.selectedStatusPos.value == index
                                        ? Icon(
                                            Icons.check,
                                            color: ColorConstants.white,
                                            size: getSubheadingTextFontSIze(),
                                          )
                                        : const SizedBox.shrink(),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: getEditTextDecoration(),
                child:
                    buildLineEditText(controller.commentController!, 'Comment'),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() => Checkbox(
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        checkColor: Colors.white,
                        activeColor: ColorConstants.primaryColor,
                        value: controller.isNFCQRChecked.value,
                        side: const BorderSide(
                            color: ColorConstants.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        onChanged: (bool? value) {
                          controller.isNFCQRChecked.value = value!;
                        },
                      )),
                  Expanded(
                      child: addText(
                          'Without NFC/QR Tag',
                          getNormalTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.w500))
                ],
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
    ));
  }

  void notifyDialog() {
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
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
              addText('Notify', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              SvgPicture.asset('assets/images/notify_dialog_image.svg'),
              SizedBox(
                height: 2.h,
              ),
              addText('Bus at the Door', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold)
            ],
          ),
        ),
      ),
    ));
  }
}
