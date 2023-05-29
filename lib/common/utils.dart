import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';

void storeValue(String key, String value) async {
  GetStorage box = Get.find<GetStorage>();
  await box.write(key, value);
}

String getValue(String key) {
  GetStorage box = Get.find<GetStorage>();
  var value = box.read(key);
  return value.toString();
}

Text addarialText(
    String text, Color color, double fontsize, FontWeight fontWeight) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: fontsize.sp,
          fontWeight: fontWeight,
          fontFamily: 'Arial'));
}

Text addText(String text, double size, Color color, FontWeight fontWeight,{TextAlign? textAlign}) {
  return Text(text.tr, style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),textAlign: textAlign,);
}

Text addOverflowText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
      ));
}

Text addAlignedText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight));
}

Text addUnderlineLineText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          decoration: TextDecoration.underline));
}

Widget addSmallEditText2(TextEditingController controller, String hintText) {
  return TextFormField(
    cursorColor: ColorConstants.primaryColor,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.next,
    style: TextStyle(fontSize: getSmallTextFontSIze()),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText.tr,
        isDense: true,
        hintStyle: TextStyle(
            fontSize: getSmallTextFontSIze(),
            color: ColorConstants.gretTextColor),
        border: InputBorder.none),
  );
}

Widget addEditText(TextEditingController controller, String hintText) {
  return Expanded(
    child: TextFormField(
      cursorColor: ColorConstants.primaryColor,
      keyboardType: TextInputType.multiline,
      controller: controller,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: getSubheadingTextFontSIze()),
      decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: TextStyle(
          fontSize: getSubheadingTextFontSIze(),
              color: ColorConstants.gretTextColor),
          border: InputBorder.none),
    ),
  );
}

Widget addSmallEditText(TextEditingController controller, String hintText) {
  return TextFormField(
    cursorColor: ColorConstants.primaryColor,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.next,
    style: TextStyle(fontSize: getNormalTextFontSIze()),
    decoration: InputDecoration(
        hintText: hintText.tr,
        hintStyle: TextStyle(
            fontSize: getNormalTextFontSIze(),
            color: ColorConstants.gretTextColor),
        border: InputBorder.none),
  );
}

Widget addEditText2(TextEditingController controller, String hintText) {
  return TextFormField(
    cursorColor: ColorConstants.primaryColor,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.next,
    style: TextStyle(fontSize: getNormalTextFontSIze()),
    decoration: InputDecoration(
        hintText: hintText.tr,
        hintStyle: TextStyle(
            fontSize: getNormalTextFontSIze(),
            color: ColorConstants.black),
        border: InputBorder.none),
  );
}

Widget addPrimaryColorEditText(
    TextEditingController controller, String hintText,
    {bool suffixIcon = false,
    void Function()? onTap,
    Widget suffix = const SizedBox()}) {
  return TextFormField(
    cursorColor: ColorConstants.primaryColor,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.next,
    style: TextStyle(
        fontSize: getHeadingTextFontSIze(),
        color: ColorConstants.primaryColor,
        fontWeight: FontWeight.w500),
    decoration: InputDecoration(
        suffixIcon: suffixIcon
            ? GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.only(top: 13, bottom: 13),
                  child: SvgPicture.asset(
                    'assets/images/ic_address.svg',
                    color: ColorConstants.primaryColor,
                  ),
                ),
              )
            : null,
        suffix: suffix,
        hintText: hintText.tr,
        hintStyle: TextStyle(
            fontSize: getSubheadingTextFontSIze(),
            color: ColorConstants.gretTextColor),
        border: InputBorder.none),
  );
}

Widget buildLineEditText(TextEditingController controller, String hint,
    {int maxlines = 5, Color color = ColorConstants.gretTextColor}) {
  return TextFormField(
    maxLines: maxlines,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.done,
    style: TextStyle(
        fontSize: getNormalTextFontSIze(),
        color: ColorConstants.black,
        fontWeight: FontWeight.normal),
    decoration: InputDecoration(
        hintText: hint.tr,
        hintStyle: TextStyle(fontSize: getNormalTextFontSIze(), color: color),
        border: InputBorder.none),
  );
}

Widget verticalDivider() {
  return SizedBox(
      height: getHeadingTextFontSIze(),
      child: const VerticalDivider(color: ColorConstants.lightGreyColor));
}

double getSmallestTextFontSIze() {
  return 1.2.h;
}

double getSmallTextFontSIze() {
  return 1.4.h;
}

double getNormalSmallTextFontSIze() {
  return 14.sp;
}

double getNormalTextFontSIze() {
  return 15.sp;
}

double getSubheadingTextFontSIze() {
  return 16.sp;
}

double getHeadingTextFontSIze() {
  return 17.sp;
}

double getLargeTextFontSIze() {
  return 21.sp;
}

BoxShadow getBoxShadow() {
  return const BoxShadow(
    color: Colors.black38,
    offset: Offset(
      0.0,
      1.0,
    ),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  );
}

BoxShadow getLightBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(
      2.0,
      3.0,
    ),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  );
}

BoxShadow getDeepBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(
      0.0,
      3.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 0.0,
  );
}

Decoration getEditTextDecoration() {
  return BoxDecoration(
      borderRadius: getBorderRadius(),
      border: Border.all(color: ColorConstants.borderColor),
      color: ColorConstants.etBgColor);
}

Decoration getPrimaryDecoration() {
  return BoxDecoration(
      borderRadius: getEdgyBorderRadius(),
      border: Border.all(color: ColorConstants.primaryColor),
      color: ColorConstants.primaryColorLight);
}

Decoration getPrimaryDecoration3() {
  return BoxDecoration(
      borderRadius: getBorderRadius(),
      border: Border.all(color: ColorConstants.primaryColor),
      color: ColorConstants.primaryColorLight);
}

Decoration getPrimaryDecoration2() {
  return BoxDecoration(
      borderRadius: getBorderRadius(),
      boxShadow: [getBoxShadow()],
      // border: Border.all(color: ColorConstants.primaryColor),
      color: ColorConstants.primaryColorLight);
}

BorderRadius getBorderRadius() {
  return BorderRadius.circular(8);
}

BorderRadius getEdgyBorderRadius() {
  return BorderRadius.circular(5);
}

BorderRadius getBorderRadiusCircular() {
  return BorderRadius.circular(200);
}

BorderRadius getCurvedBorderRadius() {
  return BorderRadius.circular(20);
}

BorderRadius getCustomBorderRadius(double radius) {
  return BorderRadius.circular(radius);
}

Widget buildInfoItems(String title, String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            addText('$title :', getSmallTextFontSIze() + 1,
                ColorConstants.black, FontWeight.normal),
            addText(' $description', getSmallTextFontSIze() + 1,
                ColorConstants.primaryColor, FontWeight.bold),
          ],
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    ),
  );
}

Widget buildColorInfoItems(String title, String description, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            addText(title, getSmallTextFontSIze() + 1, ColorConstants.black,
                FontWeight.normal),
            addText(' : $description', getSmallTextFontSIze() + 1, color,
                FontWeight.bold),
          ],
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    ),
  );
}

Widget buildInputField(String fieldName, TextEditingController controller,
    {int maxlines = 1, String hintText = 'Type here.....'}) {
  return Row(
    crossAxisAlignment:
        maxlines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(top: maxlines > 1 ? 10 : 0),
        child: addText(fieldName, getNormalTextFontSIze(), ColorConstants.black,
            FontWeight.w700),
      ),

      Container(
        width: 65.w,
        decoration: getEditTextDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          cursorColor: ColorConstants.primaryColor,
          keyboardType: TextInputType.text,
          controller: controller,
          maxLines: maxlines,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: getNormalTextFontSIze()),
          decoration: InputDecoration(
              hintText: hintText.tr,
              hintStyle: TextStyle(
                  fontSize: getNormalTextFontSIze(),
                  color: ColorConstants.gretTextColor),
              border: InputBorder.none),
        ),
      )

      // Flexible(
      //   flex: 7,
      //   child: addDecoratedEditText(controller, 'Type here.....'),
      // )
    ],
  );
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorConstants.primaryColor,
      textColor: ColorConstants.white,
      fontSize: 16.0);
}

Widget getLightDivider() {
  return Divider(
    color: ColorConstants.borderColor2,
    height: 3.h,
  );
}

void showProgramNFCDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: SizedBox(
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: ColorConstants.lightTextColor,
                          ),
                        ),
                      ),
                      addAlignedText('Programme NFC', getHeadingTextFontSIze(),
                          ColorConstants.black, FontWeight.w700),
                      SizedBox(
                        height: 3.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          showNFCSuccessfulDialogue(context);
                        },
                        child: addAlignedText(
                            'Tap NFC card to match\nfrequency!',
                            getSubheadingTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

void showNFCSuccessfulDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: SizedBox(
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      cardActivatedDialogue(context);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.close,
                              color: ColorConstants.lightTextColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 8.h,
                          height: 8.h,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: ColorConstants.primaryColor,
                                width: 1.0,
                              ),
                              boxShadow: [getDeepBoxShadow()],
                              color: ColorConstants.primaryColorLight),
                          child: Icon(
                            Icons.check,
                            color: ColorConstants.primaryColor,
                            size: 5.h,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        addAlignedText(
                            'NFC programmed successfully',
                            getSubheadingTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.w700),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

void cardActivatedDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: SizedBox(
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: ColorConstants.lightTextColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 8.h,
                        height: 8.h,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: ColorConstants.primaryColor,
                              width: 1.0,
                            ),
                            boxShadow: [getDeepBoxShadow()],
                            color: ColorConstants.primaryColorLight),
                        child: Icon(
                          Icons.check,
                          color: ColorConstants.primaryColor,
                          size: 5.h,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      addAlignedText(
                          'New Card/Tags Activated',
                          getSubheadingTextFontSIze(),
                          ColorConstants.black,
                          FontWeight.w700),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addText('By :', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.normal),
                          addText(' Admin', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

Widget buildDivider() {
  return Divider(
    color: ColorConstants.borderColor2.withOpacity(0.5),
    thickness: 2,
    height: 3.h,
  );
}

showDocumentPopup(BuildContext context, String title) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
          backgroundColor: ColorConstants.white,
          elevation: 10,
          scrollable: true,
          title: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: addAlignedText(title, getHeadingTextFontSIze(),
                    ColorConstants.black, FontWeight.w600),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      )))
            ],
          ),
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: getCurvedBorderRadius()),
          content: SizedBox(
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    'assets/images/pdf.png',
                    color: ColorConstants.lightGreyColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  addText('12/07/2022', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.normal),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          )));
}

Future<void> showPicker(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null) {}
}

showcancelremainderDialog(BuildContext context) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return StatefulBuilder(builder: (context, StateSetter sState) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            content: SizedBox(
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: ColorConstants.lightTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  addAlignedText("Are you sure to cancel this reminder? ", 16,
                      Colors.black, FontWeight.w700),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircularBorderedButton(width: 30.w, text: 'Yes'),
                  ),
                ],
              ),
            ),
          );
        });
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
