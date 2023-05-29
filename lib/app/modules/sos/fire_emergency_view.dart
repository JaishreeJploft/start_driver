import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/sos_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

import '../../../common/app_header.dart';



class FireEmergencyView extends GetView<SOSController> {
  const FireEmergencyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'SOS',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0XFFE62626),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/accident.svg',color: ColorConstants.yellow,
                              height: 90,
                              width: 90,
                            ),
                            const SizedBox(height: 20),
                            addText('Bus Accident', getLargeTextFontSIze()+10.sp, ColorConstants.white, FontWeight.bold),
                            const SizedBox(height: 20),
                            Text(
                              'Bus Accident Reported at Mall Road Please report to assembly point for evacuation.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // SizedBox(
                            //   width: 200,
                            //   height: 50,
                            //   child: mainBtn(
                            //     text: 'reached',
                            //     radius: 19,
                            //     onTap: () {
                            //       Get.toNamed(Routes.sosAssembly);
                            //     },
                            //     fontSize: 17.sp,
                            //   ),
                            // ),

                            GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.sosAssembly);
                              },
                              child: BorderedButton(width: 0, text: 'REACHED'),
                            ),


                            const SizedBox(height: 20),
                            // SizedBox(
                            //   width: 200,
                            //   height: 50,
                            //   child: mainBtn(
                            //     text: 'help me',
                            //     radius: 19,
                            //     onTap: () {
                            //       Get.toNamed(Routes.askForHelp);
                            //     },
                            //   ),
                            // ),

                            GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.askForHelpView);
                              },
                              child: BorderedButton(width: 0, text: 'HELP ME'),
                            ),


                            const SizedBox(height: 30),
                            Text(
                              'Reported by: Ahmed (Teacher)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
