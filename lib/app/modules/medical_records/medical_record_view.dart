import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/medical_record_controller.dart';
import 'package:stardriver/app/modules/medical_records/dialog/add_medical_files_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_fab.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class MedicalRecordView extends GetView<MedicalRecordController> {
  const MedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: Obx(() => controller.showFab.value ? FlipInX(
        child: CustomFAB(isIcon: true, buttonText: 'Add Medical\nRecord',icon: Icons.add,onButtonClicked: (){
          Get.dialog(const AddMedicalFilesDialog());
        },),
      ) : const SizedBox.shrink()),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Medical Records',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
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
                      children: [
                        addText('Nawaz Alam', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w600),
                        const SizedBox(
                          height: 2,
                        ),
                        addText('#632541', getNormalTextFontSIze(),
                            ColorConstants.primaryColor, FontWeight.w600),
                        const SizedBox(
                          height: 2,
                        ),
                        buildInfoItems('Blood Type', 'A+'),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        // buildDeactivated(),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        GestureDetector(onTap: (){
                          Get.dialog(Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center(
                              child: Container(
                                width: 100.w,
                                margin:
                                const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: getCurvedBorderRadius(),
                                    border: Border.all(
                                        color: ColorConstants.borderColor),
                                    color: ColorConstants.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Get.back(),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        addText(
                                            'Qr Code',
                                            getSubheadingTextFontSIze(),
                                            ColorConstants.black,
                                            FontWeight.bold),
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
                                    SvgPicture.asset(
                                      'assets/images/qrcode.svg',
                                      width: 60.w,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },child: SvgPicture.asset('assets/images/qrcode.svg'))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              buildMedicalSurvey(context),
              SizedBox(
                height: 2.h,
              ),
              buildMedicalRecords(context),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMedicalSurvey(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: ColorConstants.primaryColor,
              collapsedIconColor: ColorConstants.primaryColor,
              tilePadding: EdgeInsets.zero,
              initiallyExpanded: true,
              title: addText('Medical Survey', getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: buildSaveButton(),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),



                Column(
                  children: [


                    //medical History
                    Align(
                        alignment: Alignment.topLeft,
                        child: addText(
                            'Medical History',
                            getSubheadingTextFontSIze(),
                            ColorConstants.primaryColor,
                            FontWeight.bold)),

                    buildDivider(),

                    Container(
                      color: Colors.white,
                      child: Table(
                        border: TableBorder.all(
                            color: ColorConstants.borderColor2.withOpacity(0.0),
                            width: 0),
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(2),
                        },
                        children: [
                          TableRow(
                              children: [
                            addAlignedText(
                                'INFECTIOUS DISEASES',
                                getSmallTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.bold),
                            addAlignedText('YES', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            addAlignedText('NO', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            addAlignedText('DETAILS', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                          ]),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    StatefulBuilder(builder: (thisLowerContext,innerSetState){
                      return ListView.builder(
                        itemCount: controller.infectiousDiseaseList2.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: Table(
                              border: TableBorder.all(color: ColorConstants.borderColor2.withOpacity(0.5),width: 1),
                              columnWidths: const {
                                0: FlexColumnWidth(3),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
                                        child: addText(
                                            controller.infectiousDiseaseList2[index]['title'].toString(),
                                            getNormalTextFontSIze(),
                                            ColorConstants.black,
                                            FontWeight.normal),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 0.h),
                                        child:Radio(
                                            toggleable: true,
                                            activeColor: ColorConstants.primaryColor, fillColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            overlayColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            value: index,
                                            groupValue: controller.infectiousDiseaseList2[index]['isSelected'],
                                            onChanged: (index1) {
                                              controller.update();
                                              innerSetState(() {
                                                controller.infectiousDiseaseList2[index]['isSelected1'] = -1;
                                                controller.infectiousDiseaseList2[index]['isSelected'] = int.tryParse(index1.toString()) ?? 0;
                                                // controller.update();
                                              });
                                              // setState(() {});
                                            }),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 0.h),
                                        child: SizedBox(
                                          width : 10.w,
                                          child: Radio(
                                            activeColor: ColorConstants.primaryColor,
                                            fillColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            overlayColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            toggleable: true,
                                            value: index,
                                            groupValue: controller.infectiousDiseaseList2[index]['isSelected1'],
                                            onChanged: (index1) {
                                              Get.log("adfasf1: $index1");

                                              innerSetState(() {
                                                controller.infectiousDiseaseList2[index]['isSelected'] = -1;
                                                controller.infectiousDiseaseList2[index]['isSelected1'] = int.tryParse(index1.toString()) ?? 0;
                                                // controller.update();
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Obx(() => int.parse(controller.infectiousDiseaseList2[index]['isSelected'].toString()) >= 0 ?
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                                        child: SvgPicture.asset('assets/images/ic_upload.svg',color: ColorConstants.primaryColor,),
                                      ) : const SizedBox.shrink())
                                    ]),
                              ],
                            ),






                            // Table(
                            //   border: TableBorder.all(
                            //       color: ColorConstants.borderColor2.withOpacity(0.5),
                            //       width: 1),
                            //   columnWidths: const {
                            //     0: FlexColumnWidth(3),
                            //     1: FlexColumnWidth(1),
                            //     2: FlexColumnWidth(1),
                            //     3: FlexColumnWidth(2),
                            //   },
                            //   children: [
                            //     TableRow(children: [
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: 2.h, horizontal: 5.w),
                            //         child: addText(
                            //             controller.infectiousDiseaseList[index],
                            //             getNormalTextFontSIze(),
                            //             ColorConstants.black,
                            //             FontWeight.normal),
                            //       ),
                            //
                            //
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(vertical: 0.h),
                            //         child: Radio(
                            //             // toggleable: true,
                            //             activeColor: ColorConstants.primaryColor,
                            //             fillColor: MaterialStateColor.resolveWith(
                            //                     (states) => ColorConstants.primaryColor),
                            //             focusColor: MaterialStateColor.resolveWith(
                            //                     (states) => ColorConstants.primaryColor),
                            //             overlayColor: MaterialStateColor.resolveWith(
                            //                     (states) => ColorConstants.primaryColor),
                            //             value: 1,
                            //             groupValue: 1,
                            //
                            //             onChanged: (index) {
                            //               Get.log(index.toString());
                            //             }),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(vertical: 0.h),
                            //         child: SizedBox(
                            //           width: 10.w,
                            //           child: Radio(
                            //               activeColor: ColorConstants.primaryColor,
                            //               fillColor: MaterialStateColor.resolveWith(
                            //                       (states) =>
                            //                   ColorConstants.primaryColor),
                            //               focusColor: MaterialStateColor.resolveWith(
                            //                       (states) =>
                            //                   ColorConstants.primaryColor),
                            //               overlayColor:
                            //               MaterialStateColor.resolveWith(
                            //                       (states) =>
                            //                   ColorConstants.primaryColor),
                            //               // toggleable: true,
                            //               value: 0,
                            //               groupValue: 1,
                            //               onChanged: (index) {
                            //                 Get.log(index.toString());
                            //               }),
                            //         ),
                            //       ),
                            //
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: 2.h, horizontal: 2.w),
                            //         child: SvgPicture.asset(
                            //           'assets/images/ic_upload.svg',
                            //           color: ColorConstants.primaryColor,
                            //         ),
                            //       ),
                            //     ]),
                            //   ],
                            // ),










                          );
                        },
                      );
                    }),

                    SizedBox(
                      height: 2.h,
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),

                    SizedBox(height: 2.h,),

                    buildDivider(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      color: Colors.white,
                      child: Table(
                        border: TableBorder.all(
                            color: ColorConstants.borderColor2.withOpacity(0.5),
                            width: 0),
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(2),
                        },
                        children: [
                          TableRow(children: [
                            addAlignedText(
                                'DISEASE/CONDITION',
                                getSmallTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.bold),
                            addAlignedText('YES', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            addAlignedText('NO', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                            addAlignedText('DETAILS', getSmallTextFontSIze(),
                                ColorConstants.black, FontWeight.bold),
                          ]),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 2.h,
                    ),


                    StatefulBuilder(builder: (thisLowerContext,innerSetState){
                      return ListView.builder(
                        itemCount: controller.diseaseConditionList2.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: Table(
                              border: TableBorder.all(color: ColorConstants.borderColor2.withOpacity(0.5),width: 1),
                              columnWidths: const {
                                0: FlexColumnWidth(3),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
                                        child: addText(
                                            controller.diseaseConditionList2[index]['title'].toString(),
                                            getNormalTextFontSIze(),
                                            ColorConstants.black,
                                            FontWeight.normal),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 0.h),
                                        child:Radio(
                                            toggleable: true,
                                            activeColor: ColorConstants.primaryColor, fillColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            overlayColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            value: index,
                                            groupValue: controller.diseaseConditionList2[index]['isSelected'],
                                            onChanged: (index1) {
                                              controller.update();
                                              innerSetState(() {
                                                controller.diseaseConditionList2[index]['isSelected1'] = -1;
                                                controller.diseaseConditionList2[index]['isSelected'] = int.tryParse(index1.toString()) ?? 0;
                                                // controller.update();
                                              });
                                              // setState(() {});
                                            }),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 0.h),
                                        child: SizedBox(
                                          width : 10.w,
                                          child: Radio(
                                            activeColor: ColorConstants.primaryColor,
                                            fillColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            overlayColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                            toggleable: true,
                                            value: index,
                                            groupValue: controller.diseaseConditionList2[index]['isSelected1'],
                                            onChanged: (index1) {
                                              Get.log("adfasf1: $index1");

                                              innerSetState(() {
                                                controller.diseaseConditionList2[index]['isSelected'] = -1;
                                                controller.diseaseConditionList2[index]['isSelected1'] = int.tryParse(index1.toString()) ?? 0;
                                                // controller.update();
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Obx(() => int.parse(controller.diseaseConditionList2[index]['isSelected'].toString()) >= 0 ?
                                      Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                                        child: SvgPicture.asset('assets/images/ic_upload.svg',color: ColorConstants.primaryColor,),
                                      ) : const SizedBox.shrink())
                                    ]),
                              ],
                            ),






                            // Table(
                            //   border: TableBorder.all(
                            //       color: ColorConstants.borderColor2.withOpacity(0.5),
                            //       width: 1),
                            //   columnWidths: const {
                            //     0: FlexColumnWidth(3),
                            //     1: FlexColumnWidth(1),
                            //     2: FlexColumnWidth(1),
                            //     3: FlexColumnWidth(2),
                            //   },
                            //   children: [
                            //     TableRow(children: [
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: 2.h, horizontal: 5.w),
                            //         child: addText(
                            //             controller.infectiousDiseaseList[index],
                            //             getNormalTextFontSIze(),
                            //             ColorConstants.black,
                            //             FontWeight.normal),
                            //       ),
                            //
                            //
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(vertical: 0.h),
                            //         child: Radio(
                            //             // toggleable: true,
                            //             activeColor: ColorConstants.primaryColor,
                            //             fillColor: MaterialStateColor.resolveWith(
                            //                     (states) => ColorConstants.primaryColor),
                            //             focusColor: MaterialStateColor.resolveWith(
                            //                     (states) => ColorConstants.primaryColor),
                            //             overlayColor: MaterialStateColor.resolveWith(
                            //                     (states) => ColorConstants.primaryColor),
                            //             value: 1,
                            //             groupValue: 1,
                            //
                            //             onChanged: (index) {
                            //               Get.log(index.toString());
                            //             }),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(vertical: 0.h),
                            //         child: SizedBox(
                            //           width: 10.w,
                            //           child: Radio(
                            //               activeColor: ColorConstants.primaryColor,
                            //               fillColor: MaterialStateColor.resolveWith(
                            //                       (states) =>
                            //                   ColorConstants.primaryColor),
                            //               focusColor: MaterialStateColor.resolveWith(
                            //                       (states) =>
                            //                   ColorConstants.primaryColor),
                            //               overlayColor:
                            //               MaterialStateColor.resolveWith(
                            //                       (states) =>
                            //                   ColorConstants.primaryColor),
                            //               // toggleable: true,
                            //               value: 0,
                            //               groupValue: 1,
                            //               onChanged: (index) {
                            //                 Get.log(index.toString());
                            //               }),
                            //         ),
                            //       ),
                            //
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: 2.h, horizontal: 2.w),
                            //         child: SvgPicture.asset(
                            //           'assets/images/ic_upload.svg',
                            //           color: ColorConstants.primaryColor,
                            //         ),
                            //       ),
                            //     ]),
                            //   ],
                            // ),










                          );
                        },
                      );
                    }),


                    // ListView.builder(
                    //   itemCount: controller.diseaseConditionList.length,
                    //   scrollDirection: Axis.vertical,
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemBuilder: (context, index) {
                    //     return Container(
                    //       color: Colors.white,
                    //       child: Table(
                    //         border: TableBorder.all(
                    //             color: ColorConstants.borderColor2.withOpacity(0.5),
                    //             width: 1),
                    //         columnWidths: const {
                    //           0: FlexColumnWidth(3),
                    //           1: FlexColumnWidth(1),
                    //           2: FlexColumnWidth(1),
                    //           3: FlexColumnWidth(2),
                    //         },
                    //         children: [
                    //           TableRow(children: [
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(
                    //                   vertical: 2.h, horizontal: 5.w),
                    //               child: addText(
                    //                   controller.diseaseConditionList[index],
                    //                   getNormalTextFontSIze(),
                    //                   ColorConstants.black,
                    //                   FontWeight.normal),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(vertical: 0.h),
                    //               child: Radio(
                    //                   toggleable: true,
                    //                   activeColor: ColorConstants.primaryColor,
                    //                   fillColor: MaterialStateColor.resolveWith(
                    //                           (states) => ColorConstants.primaryColor),
                    //                   focusColor: MaterialStateColor.resolveWith(
                    //                           (states) => ColorConstants.primaryColor),
                    //                   overlayColor: MaterialStateColor.resolveWith(
                    //                           (states) => ColorConstants.primaryColor),
                    //                   value: 1,
                    //                   groupValue: 1,
                    //                   onChanged: (index) {}),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(vertical: 0.h),
                    //               child: SizedBox(
                    //                 width: 10.w,
                    //                 child: Radio(
                    //                     activeColor: ColorConstants.primaryColor,
                    //                     fillColor: MaterialStateColor.resolveWith(
                    //                             (states) =>
                    //                         ColorConstants.primaryColor),
                    //                     focusColor: MaterialStateColor.resolveWith(
                    //                             (states) =>
                    //                         ColorConstants.primaryColor),
                    //                     overlayColor:
                    //                     MaterialStateColor.resolveWith(
                    //                             (states) =>
                    //                         ColorConstants.primaryColor),
                    //                     toggleable: true,
                    //                     value: 0,
                    //                     groupValue: 1,
                    //                     onChanged: (index) {}),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(
                    //                   vertical: 2.h, horizontal: 2.w),
                    //               child: SvgPicture.asset(
                    //                 'assets/images/ic_upload.svg',
                    //                 color: ColorConstants.primaryColor,
                    //               ),
                    //             ),
                    //           ]),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // ),













                    SizedBox(
                      height: 2.h,
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: addText('History of :', getNormalTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 3,
                            child: SizedBox(
                                width: 100.w,
                                child: addText(
                                    'Blood Transfusion',
                                    getNormalTextFontSIze(),
                                    ColorConstants.black,
                                    FontWeight.w500))),
                        Flexible(
                          flex: 2,
                          child: Obx(() => RadioButton(
                              description: "Yes",
                              value: "Yes",
                              groupValue: controller.bloodTransfusionValue.value,
                              fillColor: ColorConstants.primaryColor,
                              activeColor: ColorConstants.primaryColor,
                              textStyle: TextStyle(fontSize: getSmallTextFontSIze()),
                              onChanged: (value) {
                                controller.bloodTransfusionValue.value =
                                    value.toString();
                              })),
                        ),
                        Flexible(
                          flex: 2,
                          child: Obx(() => RadioButton(
                              description: "No",
                              value: "No",
                              textStyle: TextStyle(fontSize: getSmallTextFontSIze()),
                              groupValue: controller.bloodTransfusionValue.value,
                              fillColor: ColorConstants.primaryColor,
                              activeColor: ColorConstants.primaryColor,
                              onChanged: (value) {
                                controller.bloodTransfusionValue.value =
                                    value.toString();
                              })),
                        ),
                        Obx(() =>
                        controller.bloodTransfusionValue.value ==
                            'Yes'
                            ? Flexible(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/images/ic_upload.svg',
                              color: ColorConstants.primaryColor,
                            ))
                            : Flexible(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/images/ic_upload.svg',
                              color: ColorConstants.white,
                            ))),
                      ],
                    ),

                    Divider(
                      color: ColorConstants.borderColor2.withOpacity(0.5),
                      thickness: 2,
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 3,
                            child: SizedBox(
                                width: 100.w,
                                child: addText(
                                    'Hospitalization :',
                                    getNormalTextFontSIze(),
                                    ColorConstants.black,
                                    FontWeight.w500))),
                        Flexible(
                          flex: 2,
                          child: Obx(() => RadioButton(
                              description: "Yes",
                              value: "Yes",
                              groupValue: controller.hospitalizationValue.value,
                              textStyle: TextStyle(fontSize: getSmallTextFontSIze()),
                              fillColor: ColorConstants.primaryColor,
                              activeColor: ColorConstants.primaryColor,
                              onChanged: (value) {
                                controller.hospitalizationValue.value =
                                    value.toString();
                              })),
                        ),

                        Flexible(
                          flex: 2,
                          child: Obx(() => RadioButton(
                              description: "No",
                              value: "No",
                              groupValue: controller.hospitalizationValue.value,
                              textStyle: TextStyle(fontSize: getSmallTextFontSIze()),
                              fillColor: ColorConstants.primaryColor,
                              activeColor: ColorConstants.primaryColor,
                              onChanged: (value) {
                                controller.hospitalizationValue.value =
                                    value.toString();
                              })),
                        ),
                        // Spacer(),

                        Obx(() => controller.hospitalizationValue.value == 'Yes' ?
                        Flexible(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/images/ic_upload.svg',
                              color: ColorConstants.primaryColor,
                            )) :
                        Flexible(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/images/ic_upload.svg',
                              color: ColorConstants.white,
                            ))

                        ),


                      ],
                    ),
                    Divider(
                      color: ColorConstants.borderColor2.withOpacity(0.5),
                      thickness: 2,
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.only(top: 1.5.h),
                                child: addText(
                                    'Currently using :',
                                    getNormalTextFontSIze(),
                                    ColorConstants.black,
                                    FontWeight.w500))),
                        Flexible(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: controller.currentlyUsingList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, int index) {
                              return Obx(() => CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: 0, vertical: -4),
                                activeColor: ColorConstants.primaryColorLight,
                                checkColor: ColorConstants.primaryColor,
                                dense: true,
                                checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                    width: 1.0,
                                    color: ColorConstants.primaryColor,
                                  ),
                                ),
                                title: addText(
                                    controller.currentlyUsingList[index],
                                    getNormalTextFontSIze(),
                                    ColorConstants.black,
                                    FontWeight.w500),
                                value: controller.selectedCurrentlyUsingList
                                    .contains(
                                    controller.currentlyUsingList[index]),
                                onChanged: (_) {
                                  if (controller.selectedCurrentlyUsingList
                                      .contains(controller
                                      .currentlyUsingList[index])) {
                                    controller.selectedCurrentlyUsingList
                                        .remove(controller.currentlyUsingList[
                                    index]); // unselect
                                  } else {
                                    controller.selectedCurrentlyUsingList.add(
                                        controller.currentlyUsingList[
                                        index]); // select
                                  }
                                },
                                controlAffinity:
                                ListTileControlAffinity.leading,
                              ));
                            },
                          ),
                        )
                      ],
                    ),

                    buildDivider(),
                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: addText('Family History :', getNormalTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    addText(
                        'Heart Disease/Diabetes/Hypertension/Mental Disorder/Stroke/Tuberculosis. Others, specify',
                        getSmallTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.normal),
                    SizedBox(
                      height: 1.h,
                    ),

                    Container(
                      height: 12.h,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: getEditTextDecoration(),
                      child: addEditText2(controller.familyHistoryController!,
                          'My grandfather has diabetes'),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: addText(
                          'Medical Examination Consent',
                          getNormalTextFontSIze(),
                          ColorConstants.primaryColor,
                          FontWeight.bold),
                    ),
                    buildDivider(),
                    SizedBox(
                      height: 2.h,
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    addText(
                        controller.medicalExaminationConsent,
                        getNormalTextFontSIze(),
                        ColorConstants.black,
                        FontWeight.normal),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Checkbox(
                          checkColor: ColorConstants.primaryColor,
                          activeColor: ColorConstants.primaryColorLight,
                          value: controller.isConsentChecked.value,
                          visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                              width: 1.0,
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onChanged: (bool? value) {
                            controller.isConsentChecked.value = value!;
                          },
                        )),
                        addText(
                            'I agree to attend the school examination.',
                            getNormalTextFontSIze(),
                            ColorConstants.black,
                            FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: addText(
                            'Medication Policy',
                            getSubheadingTextFontSIze(),
                            ColorConstants.primaryColor,
                            FontWeight.bold)),
                    buildDivider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Checkbox(
                          checkColor: ColorConstants.primaryColor,
                          activeColor: ColorConstants.primaryColorLight,
                          value: controller.isMedicationPolicyChecked.value,
                          visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                              width: 1.0,
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onChanged: (bool? value) {
                            controller.isMedicationPolicyChecked.value = value!;
                          },
                        )),
                        addText('I agree with', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.normal),
                      ],
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    addText(controller.medicationPolicy, getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(()=>Container(
                        width: 100.w,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.primaryColor),
                            color: ColorConstants.white,
                            boxShadow: [getBoxShadow()],
                            borderRadius: getCurvedBorderRadius()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText(
                                'Are you allergic to any medication?',
                                getNormalTextFontSIze(),
                                ColorConstants.black,
                                FontWeight.bold),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: ListView.builder(
                                itemCount: controller.yesNoList.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Obx(() => GestureDetector(
                                    onTap: () {
                                      controller.allergicMedicationSelectedPos.value = index;
                                    },
                                    child: Container(
                                      height: 4.h,
                                      width: 20.w,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: controller
                                          .allergicMedicationSelectedPos
                                          .value ==
                                          index
                                          ? getPrimaryDecoration()
                                          : getEditTextDecoration(),
                                      child: Center(
                                          child: addText(
                                              controller.yesNoList[index],
                                              getNormalTextFontSIze(),
                                              controller.allergicMedicationSelectedPos
                                                  .value ==
                                                  index
                                                  ? ColorConstants.primaryColor
                                                  : ColorConstants.borderColor,
                                              FontWeight.normal)),
                                    ),
                                  ));
                                },
                              ),
                            ),
                            SizedBox(
                              height: controller.allergicMedicationSelectedPos.value == 0 ? 1.h : 0,
                            ),
                            Visibility(
                              visible: controller.allergicMedicationSelectedPos.value == 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: getEditTextDecoration(),
                                child: addEditText2(
                                    controller.allergicMedicineController!,
                                    'Type here...'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    Align(
                        alignment: Alignment.topLeft,
                        child: addText(
                            'Sickness Exclusion Policy',
                            getSubheadingTextFontSIze(),
                            ColorConstants.primaryColor,
                            FontWeight.bold)),
                    buildDivider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => Checkbox(
                          checkColor: ColorConstants.primaryColor,
                          activeColor: ColorConstants.primaryColorLight,
                          value: controller.isSicknessPolicyChecked.value,
                          visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                              width: 1.0,
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onChanged: (bool? value) {
                            controller.isSicknessPolicyChecked.value = value!;
                          },
                        )),
                        addText('I agree to', getNormalTextFontSIze(),
                            ColorConstants.black, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    addText(controller.sicknessPolicy, getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: buildSaveButton(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),


                  ],
                ),


                addText(
                    'Do you want to use School Canteen Services?',
                    getNormalTextFontSIze(),
                    ColorConstants.black,
                    FontWeight.bold),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 4.h,
                    child: ListView.builder(
                      itemCount: controller.yesNoList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                          onTap: () {
                            controller.allergicSelectedPos.value = index;
                          },
                          child: Container(
                            height: 4.h,
                            width: 20.w,
                            margin: const EdgeInsets.only(right: 10),
                            decoration:
                            controller.allergicSelectedPos.value ==
                                index
                                ? getPrimaryDecoration()
                                : getEditTextDecoration(),
                            child: Center(
                                child: addText(
                                    controller.yesNoList[index],
                                    getNormalTextFontSIze(),
                                    controller.allergicSelectedPos.value ==
                                        index
                                        ? ColorConstants.primaryColor
                                        : ColorConstants.borderColor,
                                    FontWeight.normal)),
                          ),
                        ));
                      },
                    ),
                  ),
                ),

                Obx(() => controller.allergicSelectedPos.value == 0 ?  Column(
                  children: [
                    Container(
                      width: 100.w,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.primaryColor),
                          color: ColorConstants.white,
                          borderRadius: getCurvedBorderRadius()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText(
                              'Star have any allergy with food?',
                              getNormalTextFontSIze(),
                              ColorConstants.black,
                              FontWeight.bold),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            height: 4.h,
                            child: ListView.builder(
                              itemCount: controller.yesNoList.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(() => GestureDetector(
                                  onTap: () {
                                    controller.useCanteenServicesPos.value =
                                        index;
                                  },
                                  child: Container(
                                    height: 4.h,
                                    width: 20.w,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: controller
                                        .useCanteenServicesPos.value ==
                                        index
                                        ? getPrimaryDecoration()
                                        : getEditTextDecoration(),
                                    child: Center(
                                        child: addText(
                                            controller.yesNoList[index],
                                            getNormalTextFontSIze(),
                                            controller.useCanteenServicesPos
                                                .value ==
                                                index
                                                ? ColorConstants.primaryColor
                                                : ColorConstants.borderColor,
                                            FontWeight.normal)),
                                  ),
                                ));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),

                          Obx(() => controller.useCanteenServicesPos.value == 0 ? ListView.builder(
                            itemCount: controller.allergyFoodList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, int index) {
                              return Obx(() => CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: 0, vertical: -4),
                                activeColor: ColorConstants.primaryColorLight,
                                checkColor: ColorConstants.primaryColor,
                                dense: true,
                                checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                    width: 1.0,
                                    color: ColorConstants.primaryColor,
                                  ),
                                ),
                                title: addText(
                                    controller.allergyFoodList[index],
                                    getNormalTextFontSIze(),
                                    ColorConstants.black,
                                    FontWeight.w500),
                                value: controller.selectedAllergicFoodList
                                    .contains(
                                    controller.allergyFoodList[index]),
                                onChanged: (_) {
                                  if (controller.selectedAllergicFoodList
                                      .contains(
                                      controller.allergyFoodList[index])) {
                                    controller.selectedAllergicFoodList.remove(
                                        controller.allergyFoodList[
                                        index]); // unselect
                                  } else {
                                    controller.selectedAllergicFoodList.add(
                                        controller
                                            .allergyFoodList[index]); // select
                                  }
                                },
                                controlAffinity:
                                ListTileControlAffinity.leading,
                              ));
                            },
                          ) : const SizedBox.shrink()),


                          Obx(() => controller.useCanteenServicesPos.value == 0 ? Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: buildSaveButton(),
                              )) : const SizedBox.shrink()),


                        ],
                      ),
                    ),



                  ],
                )  : SizedBox(height: 2.h,)),










              ]),
        ),
      ),
    );
  }

  Widget buildMedicalRecords(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: ColorConstants.primaryColor,
              collapsedIconColor: ColorConstants.primaryColor,
              onExpansionChanged: (value){
                controller.showFab.value = value;
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              initiallyExpanded: false,
              title: addText('Medical Records', getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: BoxDecoration(
                        boxShadow: [getDeepBoxShadow()],
                        borderRadius: getBorderRadius(),
                        color: ColorConstants.white,
                      ),
                      child: Column(
                        children: [
                          buildInfoItems('Title', 'Food Allergy'),
                          buildDivider(),
                          // buildLongReason('ic_complaints', 'Comment', 'behavior of the driver are not good with me please take some action or ask him to understand the concern.'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/ic_complaints.svg',
                                height: getHeadingTextFontSIze(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Description ".tr,
                                          style: TextStyle(
                                            fontFamily: 'Ariel',
                                            fontSize: getSmallTextFontSIze()+1,
                                            color: ColorConstants.black,
                                            fontWeight: FontWeight.normal,
                                          )),
                                      TextSpan(
                                        text: ": Physical Activity and Nutrition. Overweight and Obesity.".tr,
                                        style: TextStyle(
                                          fontFamily: 'Ariel',
                                          fontSize: getSmallTextFontSIze()+1,
                                          color: ColorConstants.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                  const SizedBox(width: 10,),
                                  addText('01/03/2022', getNormalTextFontSIze(),
                                      ColorConstants.black, FontWeight.w500)
                                ],
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/ic_time.svg',
                                    height: getHeadingTextFontSIze(),
                                  ),
                                  const SizedBox(width: 10,),
                                  addText('09:13pm', getNormalTextFontSIze(),
                                      ColorConstants.black, FontWeight.w500)
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          buildDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addText('food_allergy.doc', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                              Row(
                                children:  [
                                  GestureDetector(
                                      onTap: (){
                                        showDocumentSupportDialog(context, index);
                                      },
                                      child: const Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,)),
                                  const SizedBox(width: 10,),
                                   GestureDetector(
                                       onTap: (){},
                                       child: const Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,))
                                ],
                              )
                            ],
                          ),
                          buildDivider(),
                          StepProgressView(width: MediaQuery.of(context).size.width,
                              curStep: controller.curStep,
                              statuses: controller.heading,
                              color: ColorConstants.primaryColor,
                              titles: controller.dates),




                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 2.h,)
              ]),
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return Container(
      width: 20.w,
      decoration: BoxDecoration(
          color: ColorConstants.primaryColorLight,
          // boxShadow: [getDeepBoxShadow()],
          border: Border.all(color: ColorConstants.primaryColor, width: 1),
          borderRadius: getCustomBorderRadius(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Center(
          child: addText('Save', getNormalTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.w500),
        ),
      ),
    );
  }

  Widget buildDeactivated() {
    return Container(
      width: 20.w,
      decoration: BoxDecoration(
          color: ColorConstants.primaryColorLight,
          // boxShadow: [getDeepBoxShadow()],
          border: Border.all(color: ColorConstants.primaryColor, width: 1.5),
          borderRadius: getBorderRadius()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
        child: Center(
          child: addText('DEACTIVATED', getSmallestTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.bold),
        ),
      ),
    );
  }

  buildLongReason(String image,String title,String description){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/$image.svg',
          height: getHeadingTextFontSIze(),
        ),
        const SizedBox(
          width: 10,
        ),
        addText(title, getSmallTextFontSIze() + 1,
            ColorConstants.black, FontWeight.normal),
        Expanded(
          child: addText(
              ' : $description',
              getSmallTextFontSIze() + 1,
              ColorConstants.primaryColor,
              FontWeight.bold),
        ),
      ],
    );
  }

  showDocumentSupportDialog(BuildContext context,int index){

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,

            scrollable: true,
            title: Stack(
              children: [
                Align(alignment: Alignment.center,
                  child: addAlignedText(
                      "Document Support",
                      getHeadingTextFontSIze(),
                      ColorConstants.black,
                      FontWeight.w600),),

                Align(alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorConstants.borderColor,
                      ),
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: getCurvedBorderRadius()),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h,),
                    Image.asset('assets/images/pdf.png',color: ColorConstants.lightGreyColor,),
                    SizedBox(height: 2.h,),
                    addText('12/07/2022', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                    SizedBox(height: 5.h,),
                  ],
                ),
              ),
            )));


  }

}