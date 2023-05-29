import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/sos_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import '../../../common/app_header.dart';


class QrScannerView extends GetView<SOSController> {
  const QrScannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'QR Scanner',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: Get.height - 200,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 230,
                              height: 230,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: SvgPicture.asset(
                                        'assets/images/side-1.svg'),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: SvgPicture.asset(
                                        'assets/images/side-2.svg'),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: SvgPicture.asset(
                                        'assets/images/side-3.svg'),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: SvgPicture.asset(
                                        'assets/images/side-4.svg'),
                                  ),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      color: Colors.white,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/images/barcode.svg',
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    top: 0,
                                    // left: 0,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        'assets/images/scan-line.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: const Color(0XFFC9C9C9),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.05,
                                      child: Container(
                                        // height: 50,
                                        // width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          border: Border.all(
                                            color: ColorConstants.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: SvgPicture.asset(
                                                'assets/images/user.svg',height: getLargeTextFontSIze()*2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Abdul Khan',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '#632541',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: ColorConstants.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  'assets/images/delete.svg',
                                  height: 25,
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
