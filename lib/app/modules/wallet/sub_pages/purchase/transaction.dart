import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/purchase_controller.dart';
import 'package:stardriver/app/modules/rating/star_rating_dialog.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/transaction_detail_dialog.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class TransactionView extends GetView<PurchaseController> {
  const TransactionView({super.key, this.type});

  final int? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: 43.w,
                      decoration: getEditTextDecoration(),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_calendar.svg',
                            height: getNormalTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          addText('From : 10/10/2022', getSmallTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: ColorConstants.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: 43.w,
                      decoration: getEditTextDecoration(),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/ic_calendar.svg',
                            height: getNormalTextFontSIze(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          addText('To : 10/10/2022', getSmallTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: ColorConstants.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 2.h,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: addText('Transactions', getNormalTextFontSIze(),
                      ColorConstants.black, FontWeight.w800)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Flexible(
              child: Container(
                // padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: getCurvedBorderRadius()),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return type == 1
                        ? buildTransaction(index)
                        : buildTopUp(index);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTransaction(int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            showTransactionDetailsDialog(tr: true);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
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
                        width: getLargeTextFontSIze() * 2.5,
                        height: getLargeTextFontSIze() * 2.5,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: ColorConstants.white,
                          borderRadius: getCustomBorderRadius(15),
                          // border: Border.all(color: ColorConstants.primaryColor)
                        ),
                        child: Image.asset(
                          'assets/images/cookies.png',
                          height: getLargeTextFontSIze() * 2,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText('Cookies', getNormalTextFontSIze(),
                              ColorConstants.black, FontWeight.bold),
                          addText('#632541', getNormalTextFontSIze(),
                              ColorConstants.primaryColor, FontWeight.bold),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Purchase ".tr,
                                    style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getNormalTextFontSIze(),
                                      color: ColorConstants.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: "(Cookies)".tr,
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "2 AED ".tr,
                                    style: TextStyle(
                                      fontFamily: 'Ariel',
                                      fontSize: getNormalTextFontSIze(),
                                      color: ColorConstants.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(
                                  text: "Received".tr,
                                  style: TextStyle(
                                    fontFamily: 'Ariel',
                                    fontSize: getSmallestTextFontSIze(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          addText('20/10/2022', getSmallTextFontSIze(),
                              ColorConstants.gretTextColor, FontWeight.normal),
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
    );
  }

  Widget buildTopUp(int? index) {
    return GestureDetector(
      onTap: () {
        showTransactionDetailsDialog();
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

  showTransactionDetailsDialog({bool tr = false}) {
    Get.dialog(
      TransactionDetailDialog(
        child: !tr,
      ),
    );
  }
}
