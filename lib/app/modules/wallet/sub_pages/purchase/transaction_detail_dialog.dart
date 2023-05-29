import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/purchase_controller.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class TransactionDetailDialog extends GetView<PurchaseController> {
  final bool? child;
  const TransactionDetailDialog({super.key, this.child = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding:
              const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: getCustomBorderRadius(15),
              border: Border.all(color: ColorConstants.borderColor),
              color: ColorConstants.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        color: Colors.transparent,
                      ),
                    ),
                    addText('Transaction Details', getSubheadingTextFontSIze(),
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
              ),
              SizedBox(
                height: 2.h,
              ),
              Stack(
                children: [
                  child == true
                      ? buildTopUp(1)
                      : GestureDetector(
                          onTap: () {
                            // showTransactionDetailsDialog();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                color: ColorConstants.white,
                                borderRadius: getCustomBorderRadius(15),
                                border: Border.all(
                                    color: ColorConstants.borderColor)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: getLargeTextFontSIze() * 2.5,
                                            height:
                                                getLargeTextFontSIze() * 2.5,
                                            padding: const EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              color: ColorConstants.white,
                                              borderRadius:
                                                  getCustomBorderRadius(15),
                                              // border: Border.all(color: ColorConstants.primaryColor)
                                            ),
                                            child: Image.asset(
                                              'assets/images/cookies.png',
                                              height:
                                                  getLargeTextFontSIze() * 2,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          addAlignedText(
                                              '#632541',
                                              getNormalTextFontSIze(),
                                              ColorConstants.primaryColor,
                                              FontWeight.bold),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          addText(
                                              'Cookies',
                                              getNormalTextFontSIze(),
                                              ColorConstants.black,
                                              FontWeight.bold),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          addText(
                                              'Order Id : 4368457',
                                              getSmallTextFontSIze(),
                                              ColorConstants.black,
                                              FontWeight.normal),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          addText(
                                              'TR No : 63879',
                                              getSmallTextFontSIze(),
                                              ColorConstants.black,
                                              FontWeight.normal),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Purchase ".tr,
                                                    style: TextStyle(
                                                      fontFamily: 'Ariel',
                                                      fontSize:
                                                          getNormalTextFontSIze(),
                                                      color:
                                                          ColorConstants.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                TextSpan(
                                                  text: "(Cookies)".tr,
                                                  style: TextStyle(
                                                    fontFamily: 'Ariel',
                                                    fontSize:
                                                        getSmallestTextFontSIze(),
                                                    color: ColorConstants.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "2 AED ".tr,
                                                    style: TextStyle(
                                                      fontFamily: 'Ariel',
                                                      fontSize:
                                                          getNormalTextFontSIze(),
                                                      color:
                                                          ColorConstants.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                TextSpan(
                                                  text: "Received".tr,
                                                  style: TextStyle(
                                                    fontFamily: 'Ariel',
                                                    fontSize:
                                                        getSmallestTextFontSIze(),
                                                    color: ColorConstants.blue,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          addText(
                                              '20/10/2022',
                                              getSmallTextFontSIze(),
                                              ColorConstants.gretTextColor,
                                              FontWeight.normal),
                                          addText(
                                              '09:00:30pm',
                                              getSmallTextFontSIze() - 1,
                                              ColorConstants.gretTextColor,
                                              FontWeight.normal),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                  // Positioned(
                  //     top: 0,
                  //     bottom: 0,
                  //     right: 5,
                  //     child: GestureDetector(
                  //       onTap: (){
                  //         // Get.dialog(StarRatingDialog());
                  //       },
                  //       child: Container(
                  //         padding: const EdgeInsets.all(5),
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             boxShadow: [getDeepBoxShadow()],
                  //             color: ColorConstants.white
                  //         ),
                  //         child: SvgPicture.asset('assets/images/star.svg'),
                  //       ),
                  //     ))
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircularBorderedButton(
                      width: double.infinity,
                      text: 'PRINT RECEIPT',
                      capFirst: false,
                      horizontalPadding: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircularBorderedButton(
                      width: double.infinity,
                      text: 'SAVE RECEIPT',
                      capFirst: false,
                      horizontalPadding: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopUp(int index) {
    return GestureDetector(
      onTap: () {
        // showTransactionDetailsDialog();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: getCustomBorderRadius(15),
            border: Border.all(color: ColorConstants.borderColor)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: ColorConstants.primaryColorLight,
                        border: Border.all(color: ColorConstants.primaryColor),
                        borderRadius: getCustomBorderRadius(15)),
                    child: Column(
                      children: [
                        addText('100', getLargeTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w900),
                        addText('AED', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w600),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      addText('Amount Added', getSubheadingTextFontSIze(),
                          ColorConstants.black, FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "TR No : ".tr,
                                style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: getNormalTextFontSIze(),
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.w500,
                                )),
                            TextSpan(
                              text: "263484".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getSmallestTextFontSIze(),
                                color: ColorConstants.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      addText('20/10/2022', getSmallTextFontSIze(),
                          ColorConstants.gretTextColor, FontWeight.normal),
                      const SizedBox(
                        height: 5,
                      ),
                      addText('09:00:30pm', getSmallTextFontSIze() - 1,
                          ColorConstants.gretTextColor, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
