import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/sos_controller.dart';
import 'package:stardriver/app/modules/qr_scanner/sos_scanQR.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/success_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class SOSView extends GetView<SOSController> {
  const SOSView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'SOS',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              buildGrids(),
              SizedBox(
                height: 3.h,
              ),
              Obx(() => (controller.selectedPos.value == 0 ||
                      controller.selectedPos.value == 1)
                  ? buildAccidentAndBreakdown(context)
                  : const SizedBox.shrink()),
              Obx(() => controller.selectedPos.value == 2
                  ? buildMedicalSupport(context)
                  : const SizedBox.shrink()),
              Obx(() => controller.selectedPos.value == 3
                  ? buildOthers(context)
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrids() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.imageList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.2),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          controller.selectedPos.value = index;
        },
        child: Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: controller.selectedPos.value == index
                      ? ColorConstants.primaryColorLight
                      : ColorConstants.white,
                  boxShadow: [getDeepBoxShadow()],
                  border: controller.selectedPos.value == index
                      ? Border.all(
                          color: ColorConstants.primaryColor, width: 1.5)
                      : null,
                  borderRadius: getCurvedBorderRadius()),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          controller.imageList[index],
                          height: 6.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        addAlignedText(
                            controller.sosTitles[index],
                            getNormalSmallTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold)
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorConstants.white, width: 2),
                          shape: BoxShape.circle,
                          boxShadow: [getDeepBoxShadow()],
                          color: controller.selectedPos.value == index
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor2),
                      child: Icon(
                        Icons.check,
                        color: ColorConstants.white,
                        size: getSubheadingTextFontSIze(),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget buildAccidentAndBreakdown(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.askForHelpView);
          },
          child: Align(
              alignment: Alignment.topLeft,
              child: addText('Ask for Help', getNormalTextFontSIze(),
                  ColorConstants.black, FontWeight.bold)),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.tripLocationView);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: getEditTextDecoration(),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorConstants.searchIconColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                addText('Location Name', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.w400),
                const Spacer(),
                SvgPicture.asset('assets/images/ic_map.svg')
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: getEditTextDecoration(),
          child: buildLineEditText(controller.commentController!, 'Comment'),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            if (controller.selectedPos.value == 0) {
              Get.dialog( sosNormalDialogs(message: 'Emergency Notification has been successfully sent. We are arranging the assistance.',icon: controller.imageList[0] ));
            } else if (controller.selectedPos.value == 1) {
              Get.toNamed(Routes.fireEmergency);
            }
          },
          child: BorderedButton(width: 50.w, text: 'NOTIFY'),
        )
      ],
    );
  }

  Widget buildMedicalSupport(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (index) =>  GestureDetector(
            onTap: () async {
              controller.selectedMedicalSupportPos.value = index;
              if (index == 1) {
                Get.to(const ScanQrCodeScreen());
              }
            },
            child: Obx(
                  () => Container(
                height: 5.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    color:
                    controller.selectedMedicalSupportPos.value == index
                        ? ColorConstants.primaryColorLight
                        : ColorConstants.white,
                    boxShadow: [getBoxShadow()],
                    borderRadius: getBorderRadius()),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: ColorConstants.white, width: 2),
                          shape: BoxShape.circle,
                          boxShadow: [getDeepBoxShadow()],
                          color: controller.selectedMedicalSupportPos.value == index
                              ? ColorConstants.primaryColor
                              : ColorConstants.borderColor2),
                      child: Icon(
                        Icons.check,
                        color: ColorConstants.white,
                        size: getNormalTextFontSIze(),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      child: SvgPicture.asset(
                        controller.imageOtherMedicalImageList[index],
                        color: controller.selectedMedicalSupportPos.value ==
                            index
                            ? ColorConstants.primaryColor
                            : ColorConstants.black,
                        height: getLargeTextFontSIze(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ))
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            if(controller.selectedMedicalSupportPos.value == 1){
              Get.to(const ScanQrCodeScreen());
            }else{
              showPassengerList();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: getEditTextDecoration(),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorConstants.searchIconColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                addText('Search', getNormalTextFontSIze(), ColorConstants.black,
                    FontWeight.w400),
                const Spacer(),
                controller.selectedMedicalSupportPos.value == 0 ||
                        controller.selectedMedicalSupportPos.value == 1
                    ? SvgPicture.asset(
                        controller.selectedMedicalSupportPos.value == 0
                            ? 'assets/images/nfc.svg'
                            : controller.selectedMedicalSupportPos.value == 1
                                ? 'assets/images/qrcode.svg'
                                : 'assets/images/hand.svg',
                        height: getLargeTextFontSIze(),
                        color: ColorConstants.primaryColor,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: addText("Support For", getNormalTextFontSIze(),
              ColorConstants.black, FontWeight.bold),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: ColorConstants.white,
              boxShadow: [getDeepBoxShadow()],
              borderRadius: getCurvedBorderRadius()),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            height: getLargeTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          addText(
                              'Sania Khan  (#455285)',
                              getSmallTextFontSIze(),
                              ColorConstants.black,
                              FontWeight.bold),
                          const Spacer(),
                          SizedBox(
                            child: SvgPicture.asset(
                              'assets/images/ic_delete.svg',
                              color: ColorConstants.primaryColor,
                              height: getLargeTextFontSIze(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (index < 2)
                    Divider(
                      color: ColorConstants.borderColor2.withOpacity(0.5),
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      height: 0,
                    ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.tripRouteView);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: getEditTextDecoration(),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorConstants.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                addText('Location Name', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.w400),
                const Spacer(),
                SvgPicture.asset('assets/images/ic_map.svg')
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
           // Get.dialog(const SuccessDialog(message: 'Successfully Notified'));
            Get.dialog(sosNormalDialogs(message: 'Emergency Notification has been successfully sent. We are arranging the assistance.',icon: controller.imageList[2] ));
          },
          child: BorderedButton(width: 50.w, text: 'NOTIFY'),
        )
      ],
    );
  }

  Widget buildOthers(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) =>  GestureDetector(
              onTap: () async {
                controller.selectedMedicalSupportPos.value = index;
                if (index == 1) {
                  Get.to(const ScanQrCodeScreen());
                }
              },
              child: Obx(
                    () => Container(
                      height: 5.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color:
                      controller.selectedMedicalSupportPos.value == index
                          ? ColorConstants.primaryColorLight
                          : ColorConstants.white,
                      boxShadow: [getBoxShadow()],
                      borderRadius: getBorderRadius()),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: ColorConstants.white, width: 2),
                            shape: BoxShape.circle,
                            boxShadow: [getDeepBoxShadow()],
                            color:
                            controller.selectedMedicalSupportPos.value ==
                                index
                                ? ColorConstants.primaryColor
                                : ColorConstants.borderColor2),
                        child: Icon(
                          Icons.check,
                          color: ColorConstants.white,
                          size: getNormalTextFontSIze(),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        child: SvgPicture.asset(
                          controller.imageOtherMedicalImageList[index],
                          color: controller.selectedMedicalSupportPos.value ==
                              index
                              ? ColorConstants.primaryColor
                              : ColorConstants.black,
                          height: getLargeTextFontSIze(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: getEditTextDecoration(),
          child: buildLineEditText(controller.commentController!, 'Comment'),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            showPassengerList();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: getEditTextDecoration(),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorConstants.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                addText('Search', getNormalTextFontSIze(), ColorConstants.black,
                    FontWeight.w400),
                const Spacer(),
                controller.selectedMedicalSupportPos.value == 0 ||
                        controller.selectedMedicalSupportPos.value == 1
                    ? SvgPicture.asset(
                        controller.selectedMedicalSupportPos.value == 0
                            ? 'assets/images/nfc.svg'
                            : 'assets/images/barcode.svg',
                        height: getLargeTextFontSIze(),
                        color: ColorConstants.primaryColor,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: ColorConstants.white,
              boxShadow: [getDeepBoxShadow()],
              borderRadius: getCurvedBorderRadius()),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            height: getLargeTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          addText(
                              'Sania Khan  (#455285)',
                              getSmallTextFontSIze(),
                              ColorConstants.black,
                              FontWeight.bold),
                          const Spacer(),
                          SizedBox(
                            child: SvgPicture.asset(
                              'assets/images/ic_delete.svg',
                              color: ColorConstants.primaryColor,
                              height: getLargeTextFontSIze(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (index < 2)
                    Divider(
                      color: ColorConstants.borderColor2.withOpacity(0.5),
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      height: 0,
                    ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.tripRouteView);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: getEditTextDecoration(),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorConstants.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                addText('Location Name', getNormalTextFontSIze(),
                    ColorConstants.black, FontWeight.w400),
                const Spacer(),
                SvgPicture.asset('assets/images/ic_map.svg')
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onTap: () {
            Get.dialog(sosNormalDialogs(message: 'Emergency Notification has been successfully sent. We are arranging the assistance.',icon: controller.imageList[3] ));
           //  showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
           //    return sosDialogs(title: "Other",icon: "assets/images/other_sos.svg",);
           //  });

          },
          child: BorderedButton(width: 50.w, text: 'NOTIFY'),
        )
      ],
    );
  }

  void showPassengerList() {
    Get.dialog(Scaffold(
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
              addText('Passenger List', getSubheadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: getEditTextDecoration(),
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
                        controller: controller.commentController!,
                        textInputAction: TextInputAction.next,
                        style:
                            TextStyle(fontSize: getNormalSmallTextFontSIze()),
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search By ID/Name...'.tr,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            hintStyle: TextStyle(
                                fontSize: getNormalSmallTextFontSIze(),
                                color: ColorConstants.borderColor),
                            border: InputBorder.none),
                      ),
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
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstants.borderColor2, width: 1),
                          borderRadius: getCustomBorderRadius(15),
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
                                borderRadius: getCustomBorderRadius(15),
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
                              addText(
                                  'Roma(Star)',
                                  getNormalSmallTextFontSIze(),
                                  ColorConstants.black,
                                  FontWeight.bold),
                              addText('#646537', getNormalSmallTextFontSIze(),
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
                child: CircularBorderedButton(width: 50.w, text: 'CONTINUE'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget sosDialogs({title,icon}){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 7.7.h),
                  SvgPicture.asset(icon,height: 90,width: 90,color: Color(0xffFDC924),),
                  SizedBox(height: 3.4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Text(title, style: TextStyle(
                        fontSize: 22.sp, color: ColorConstants.white
                    ) ,),
                  ),
                  SizedBox(height: 3.7.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: TextStyle(fontSize: 17.sp, color: ColorConstants.white, height: 1.3),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    //'${translate(context).reported_by}'
                        ': Ahmed (Teacher)', style: TextStyle(fontSize: 16.sp, color: ColorConstants.white),),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: Icon(Icons.close_rounded,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sosNormalDialogs({message,icon}){
    return
      Scaffold(
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
                      color: ColorConstants.lightGreyColor,
                    ),
                  ),
                ),
                SvgPicture.asset(icon,height: 80,width: 80,
                 // color: Color(0xffFDC924)
                  ),
                SizedBox(
                  height: 2.h,
                ),
                addText(message, getHeadingTextFontSIze()-2,
                      ColorConstants.black, FontWeight.bold, textAlign: TextAlign.center),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      );
  }









}
