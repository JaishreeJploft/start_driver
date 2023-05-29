import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/activation_controller.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class ActivationSubView extends GetView<ActivationController>{
  const ActivationSubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: buildComplainList(context),
      ),
    );
  }

  Widget buildComplainList(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            boxShadow: [getBoxShadow()],
            borderRadius: getBorderRadius(),
            color: ColorConstants.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/ic_calendar.svg',
                          height: getHeadingTextFontSIze()),
                      const SizedBox(width: 10,),
                      addText('01/03/2022', getSmallTextFontSIze()+1,
                          ColorConstants.primaryColor, FontWeight.bold)
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
                      addText('09:13pm', getSmallTextFontSIze()+1,
                          ColorConstants.primaryColor, FontWeight.bold)
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              buildDivider(),
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
                              text: "Deactivation Reason : ".tr,
                              style: TextStyle(
                                fontFamily: 'Ariel',
                                fontSize: getSmallTextFontSIze()+1,
                                color: ColorConstants.black,
                                fontWeight: FontWeight.normal,
                              )),
                          TextSpan(
                            text: "Suspected to have Covid-19 symptoms and is deactivated for the awareness of the students.".tr,
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
              buildLongReason('ic_complaints', 'Required Evidence', '1. RT- PCR Report'),
              buildDivider(),
              buildLongReason('fab_calendar', 'Due Date', '12/07/2022'),
              buildDivider(),
              Align(
                  alignment: Alignment.topLeft,
                  child: addText('Activation', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold)),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/ic_calendar.svg',
                          height: getHeadingTextFontSIze()),
                      const SizedBox(width: 10,),
                      addText('01/03/2022', getSmallTextFontSIze()+1,
                          ColorConstants.primaryColor, FontWeight.bold)
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
                      addText('09:13pm', getSmallTextFontSIze()+1,
                          ColorConstants.primaryColor, FontWeight.bold)
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              buildDivider(),

              Row(
                children: [
                  addText('Medical Certificate', getNormalTextFontSIze(), ColorConstants.black, FontWeight.bold),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      showDocumentPopup(context, 'Medical Certificate');
                    },
                    child: Icon(Icons.remove_red_eye_outlined,size: getLargeTextFontSIze(),color: ColorConstants.primaryColor,),
                  ),
                  SizedBox(width: 3.w,),
                  GestureDetector(
                    onTap: (){
                    },
                    child: Icon(Icons.download_for_offline,size: getLargeTextFontSIze(),color: ColorConstants.primaryColor,),
                  ),

                ],
              ),

              buildDivider(),
              StepProgressView(width: MediaQuery.of(context).size.width,
                  curStep: 3,
                  statuses: const ['Request\nRaised','Evidence in\nReview','Completed'],
                  color: ColorConstants.primaryColor,
                  titles: const ['July 2', 'July 3', 'July 4']),




            ],
          ),
        );
      },
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



}