import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'common/color_constants.dart';
// import '../../utils/font_family.dart';

showCustomDialog(
  context, {
  required String title,
  List<Widget> children = const [],
  double height = 200,
  padding = const EdgeInsets.all(45),
}) async {
  Dialog myDialog = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        insetPadding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: padding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
              Align(
                heightFactor: 1,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      // fontFamily: FontFamily.arial,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                          color: ColorConstants.borderColor,
                        ),
                      ))),
            ],
          ),
        ),
      );
    },
  );

  return myDialog;
}
