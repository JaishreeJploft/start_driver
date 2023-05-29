import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/activation_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/bordered_button2.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class DeactivationDetailsView extends GetView<ActivationController>{
  const DeactivationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Deactivation Details',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: getCurvedBorderRadius(),
                  boxShadow: [getBoxShadow()],
                  color: ColorConstants.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration:  BoxDecoration(
                              borderRadius: getCurvedBorderRadius(),
                              border: Border.all(color: ColorConstants.primaryColor),
                            ),
                            child: SvgPicture.asset('assets/images/user.svg',height: getLargeTextFontSIze()*2,),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              addText('Rafiq Khan', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                              SizedBox(
                                  width: 30.w,
                                  child: Divider(
                                    height: 5,
                                    color: ColorConstants.primaryColor.withOpacity(0.1),
                                    thickness: 2,
                                  )),
                              addText('#546938', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                              SizedBox(
                                  width: 30.w,
                                  child: Divider(
                                    color: ColorConstants.primaryColor.withOpacity(0.1),
                                    thickness: 2,
                                    height: 5,
                                  )),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Blood Type".tr,
                                        style: TextStyle(
                                          fontFamily: 'Ariel',
                                          fontSize: getNormalTextFontSIze(),
                                          color: ColorConstants.black,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    TextSpan(
                                      text: ": A+".tr,
                                      style: TextStyle(
                                        fontFamily: 'Ariel',
                                        fontSize: getNormalTextFontSIze(),
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
                          Column(
                            children: [

                              GestureDetector(
                                onTap: (){

                                }, child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: getCurvedBorderRadius(),
                                    border: Border.all(color: ColorConstants.primaryColor),
                                    color: ColorConstants.primaryColorLight),
                                child: addText('DEACTIVATED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
                              ),
                              ),
                              SizedBox(height: 1.h,),
                              GestureDetector(
                                onTap: (){
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
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                addText('Qr Code', getSubheadingTextFontSIze(),
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
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            SvgPicture.asset('assets/images/qrcode.svg',width: 60.w,),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                                }, child: SvgPicture.asset('assets/images/qrcode.svg'),
                              )

                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoItems('Deactivation Date', '12-07-2022'),
                        verticalDivider(),
                        buildInfoItems('Time', '9:30 am'),
                      ],
                    ),
                    SizedBox(height: 1.h,)
                  ],
                ),
              ),
              SizedBox(height: 3.h,),
              addText('Deactivation Reason', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
              const SizedBox(height: 5,),
              addText('Suspected to have Covid-19 symptoms and is deactivated for the awareness of the students.',
                  getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),

              SizedBox(height: 3.h,),
              addText('Required Evidence', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
              const SizedBox(height: 5,),
              addText('1. RT- PCR Report',
                  getSmallTextFontSIze(), ColorConstants.black, FontWeight.normal),


              SizedBox(height: 3.h,),
              const Divider(),
              SizedBox(height: 2.h,),
              addText('Note - For activation please upload the required evidence.',
                  getSmallTextFontSIze(), ColorConstants.lightGreyColor, FontWeight.normal),

              SizedBox(height: 3.h,),
              addText('Medical Certificate', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
              SizedBox(height: 2.h,),
              Row(
                children: [

                  Flexible(
                      flex: 7,
                      child: Column(
                        children: [

                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: getEditTextDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText('dd/mm/yyyy   -  hh:mm', getNormalTextFontSIze()-1, ColorConstants.gretTextColor, FontWeight.normal),
                                GestureDetector(
                                    onTap: () => showPicker(context),
                                    child: SvgPicture.asset('assets/images/fab_calendar.svg',color: ColorConstants.gretTextColor,height: getLargeTextFontSIze()))
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: getEditTextDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: addText('Health Certificate for 23/04/2022 Reason: Absent', getSmallTextFontSIze(), ColorConstants.gretTextColor,
                                    FontWeight.normal)),
                                const SizedBox(width: 10,),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorConstants.primaryColor),
                                  child: Icon(
                                    Icons.check,
                                    color: ColorConstants.white,
                                    size: getHeadingTextFontSIze(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: getEditTextDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                addText('Upload File', getNormalTextFontSIze()-1, ColorConstants.gretTextColor, FontWeight.normal),
                                SvgPicture.asset('assets/images/ic_upload.svg',color: ColorConstants.gretTextColor,height: getLargeTextFontSIze(),)
                              ],
                            ),
                          ),


                        ],
                      )),
                  const SizedBox(width: 10,),
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [



                          addAlignedText('Medical_Sania.jpeg', getSmallestTextFontSIze(), ColorConstants.gretTextColor,
                              FontWeight.normal),


                          addAlignedText('Photo Uploaded\n132KB', getSmallestTextFontSIze()-1, ColorConstants.blue,
                              FontWeight.w600),


                        ],
                      ))


                ],
              ),
              SizedBox(height: 3.h,),

              GestureDetector(
                onTap: (){
                  _showActivationDialogue(context);
                },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: BorderedButton2(text: 'REQUEST FOR ACTIVATION')))

            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoItems(String title,String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              addText(title, getNormalTextFontSIze(), ColorConstants.black,
                  FontWeight.normal),

              addText(' : $description', getNormalTextFontSIze(), ColorConstants.primaryColor,
                  FontWeight.bold),

            ],
          ),

          SizedBox(height: 1.h,)
        ],
      ),
    );
  }

  void _showActivationDialogue(BuildContext context) {
    showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.close,size: getLargeTextFontSIze(),color: ColorConstants.lightGreyColor,),
                          )
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.activationRequest);
                          },
                          child: addAlignedText('Your request for account activation sent to School admin, will be notified soon.', getHeadingTextFontSIze(),
                              ColorConstants.black, FontWeight.w700),
                        ),
                        const SizedBox(height: 20,),

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


}