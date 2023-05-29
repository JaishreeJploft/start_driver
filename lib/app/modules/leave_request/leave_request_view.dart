import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/leave_request_controller.dart';
import 'package:stardriver/app/modules/leave_request/leave_balance_dialog.dart';
import 'package:stardriver/app/modules/leave_request/upload_evidence_dialog.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/delete_dialog.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/custom_fab.dart';
import 'package:stardriver/common/custom_stepper.dart';
import 'package:stardriver/common/utils.dart';

class LeaveRequestView extends GetView<LeaveRequestController>{
  const LeaveRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: CustomFAB(isIcon: true, buttonText: 'Leave Requests',icon: Icons.add,onButtonClicked: (){
        controller.leaveRequestHeading.value = 'Leave Requests';
        Get.toNamed(Routes.requestLeave);
      },),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'Leave Requests',
          )),
      body: Column(
        children: [
          Container(
            width: 100.w,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: getBorderRadius(),
                // boxShadow: [getBoxShadow()],
                border: Border.all(color: ColorConstants.borderColor),
                color: ColorConstants.primaryColorLight),
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: buildSchoolDropDown(),
          ),
          SizedBox(height: 1.h,),
          IntrinsicHeight (
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Flexible(
                  flex: 4,
                  child: Container(
                  width: 100.w,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: getBorderRadius(),
                      // boxShadow: [getBoxShadow()],
                      border: Border.all(color: ColorConstants.borderColor),
                      color: ColorConstants.primaryColorLight),
                  padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
                  child: buildLeaveTypeDropDown(),
                ),),


                Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){
                        Get.dialog(const LeaveBalanceDialog());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 100.w,
                        decoration: getPrimaryDecoration(),
                        child: Center(child: addText('CHECK LEAVE BALANCE', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold)),
                      ),
                    ))

              ],
            ),
          ),
          SizedBox(height: 1.h,),
          buildRequests(context)

        ],
      ),
    );
  }

  Widget buildRequests(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  boxShadow: [getBoxShadow()],
                  borderRadius: getBorderRadius(),
                  color: ColorConstants.white,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addText('Leave Type : ', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        addText(index.isEven ? 'CL' : 'SL', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                        const Spacer(),

                        GestureDetector(onTap: (){

                          Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this?'));

                        }, child: SvgPicture.asset('assets/images/ic_delete.svg',height: getHeadingTextFontSIze(),),),
                         SizedBox(width: 5.w,),
                        GestureDetector(onTap: (){
                          controller.leaveRequestHeading.value = 'Edit';
                          Get.toNamed(Routes.requestLeave);
                        }, child: SvgPicture.asset('assets/images/ic_edit.svg',height: getHeadingTextFontSIze())),
                         SizedBox(width: 5.w,),
                        GestureDetector(
                          onTap: (){
                            Get.dialog(const UploadEvidenceDialog());
                          },
                          child: Column(
                            children: [
                              GestureDetector(onTap: (){}, child: SvgPicture.asset('assets/images/ic_upload.svg',color: ColorConstants.primaryColor,height: getHeadingTextFontSIze())),
                              addAlignedText('Upload\nEvidence', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                            ],
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
                            SvgPicture.asset('assets/images/fab_calendar.svg',
                                height: getHeadingTextFontSIze()),
                            const SizedBox(width: 10,),
                            addText('01/03/2022', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.w500)
                          ],
                        ),
                        const Spacer(),
                        addText('to', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/fab_calendar.svg',
                                height: getHeadingTextFontSIze()),
                            const SizedBox(width: 10,),
                            addText('01/03/2022', getNormalTextFontSIze(),
                                ColorConstants.black, FontWeight.w500)
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    buildDivider(),
                    buildLongReason("assets/images/ic_reason.svg", "Reason", "Lorem Ipsum is simply dummy text"),
                    buildDivider(),
                    buildLongReason("assets/images/ic_reason.svg", "Comment", "Ok I will talk to her, Ok I will talk to her"),
                    if(index == 1)
                    buildDivider(),
                    if(index == 1)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_reason.svg',
                          height: getHeadingTextFontSIze(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        addText('Evidence', getSmallTextFontSIze() + 1,
                            ColorConstants.black, FontWeight.normal),
                        Row(
                          children: [
                            addText(
                                ' : Ok I will talk to her',
                                getSmallTextFontSIze() + 1,
                                ColorConstants.primaryColor,
                                FontWeight.bold),

                            SizedBox(width: 4.w,),

                            GestureDetector(
                              onTap: (){
                                showDocumentPopup(context, 'Leave Request');
                              },
                              child: Icon(Icons.remove_red_eye_outlined,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                            ),
                            SizedBox(width: 3.w,),
                            GestureDetector(
                              onTap: (){},
                              child: Icon(Icons.download_for_offline,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                            ),


                          ],
                        ),
                      ],
                    ),

                    buildDivider(),



                    if(index == 0)
                    StepProgressView(width: MediaQuery.of(context).size.width,
                        curStep: 3,
                        statuses: const ['Request\nRaised','Request\nAccepted','Evidence\nSubmitted','Evidence\nApproved'],
                        color: ColorConstants.primaryColor,
                        titles: controller.dates),



                    if(index == 1)
                      StepProgressView(width: MediaQuery.of(context).size.width,
                          curStep: 4,
                          statuses: const ['Request\nRaised','Request\nAccepted','Evidence\nSubmitted','Evidence\nApproved'],
                          color: ColorConstants.primaryColor,
                          titles: controller.dates),




                  ],
                ),
              ),

              if(index == 1)
                SizedBox(height: 15.h,)


            ],
          );
        },
      ),
    );
  }

  buildLongReason(String image, String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          image,
          height: getHeadingTextFontSIze(),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                  style: TextStyle(fontSize: 14.6.sp),
                  children: [
                    TextSpan(
                        text: "$title : ",
                        style: const TextStyle(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.normal,
                        )
                    ),
                    TextSpan(
                        text: description,
                        style: const TextStyle(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        )
                    )
                  ]
              )
          ),
        ),
      ],
    );
  }


  Widget buildSchoolDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: controller.schoolItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.gretTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: controller.selectedSchool.value,
          onChanged: (value) {
            controller.selectedSchool.value = value.toString();
          },
          icon:  Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze()*1.5,
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          // buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          // dropdownWidth: 78.w,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: const Offset(-20, 0),
        ),
      )),
    );
  }

  Widget buildLeaveTypeDropDown() {
    return Center(
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: addText('Leave Type', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal),
          items: controller.leaveItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: getNormalTextFontSIze(),
                fontWeight: FontWeight.normal,
                color: ColorConstants.gretTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          // value: controller.selectedLeaveType.value ?? '',
          value : controller.selectedLeaveType.value.isNotEmpty
              ? controller.selectedLeaveType.value
              : null,
          onChanged: (value) {
            controller.selectedLeaveType.value = value.toString();
          },
          icon:  Icon(
            Icons.arrow_drop_down_rounded,
            size: getLargeTextFontSIze()*1.5,
            color: ColorConstants.lightTextColor,
          ),
          iconSize: 14,
          iconEnabledColor: ColorConstants.gretTextColor,
          iconDisabledColor: Colors.grey,
          buttonWidth: 80.w,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 100.h,
          dropdownWidth: 33.w,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          dropdownElevation: 1,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-10, 0),
        ),
      )),
    );
  }

}