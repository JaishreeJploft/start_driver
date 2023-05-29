import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/my_profile_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/circular_bordered_button.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ProfileDetails extends GetView<MyProfileController> {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInRight(
                duration: const Duration(milliseconds: 400),
                child: buildMyInformation(context)),
            SizedBox(
              height: 2.h,
            ),
            FadeInRight(
                duration: const Duration(milliseconds: 500),
                child: buildJobDetails(context)),
            SizedBox(
              height: 2.h,
            ),
            FadeInRight(
                duration: const Duration(milliseconds: 600),
                child: buildFamilyInfo(context)),
            FadeInRight(
                child: SizedBox(
              height: 10.h,
            ))
          ],
        ),
      ),
    );
  }

  Widget buildMyInformation(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: getCurvedBorderRadius(),
          side: const BorderSide(color: ColorConstants.primaryColor)),
      clipBehavior: Clip.none,
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
              title: addText('My Information', getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInfoItems('Mobile No', '9563214563'),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.editProfileView);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColorLight,
                            // boxShadow: [getDeepBoxShadow()],
                            border: Border.all(
                                color: ColorConstants.primaryColor, width: 1.5),
                            borderRadius: getBorderRadiusCircular()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Center(
                            child: addText('EDIT', getNormalTextFontSIze(),
                                ColorConstants.primaryColor, FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                buildInfoItems('Alternative Mobile', '9795214563'),
                const SizedBox(height: 5),
                buildInfoItems('Email', 'rafiq_khan007@gmail.com'),
                const SizedBox(height: 5),
                buildInfoItems('DOB', '17 March, 1985'),
                const SizedBox(height: 5),
                buildInfoItems('Address', 'PO Box: 9440 Dubai UAE'),
                const SizedBox(height: 5),
                buildInfoItems('Country', 'UAE'),
                const SizedBox(height: 5),
                buildInfoItems('Sector', 'Dubai'),
                const SizedBox(height: 5),
                buildInfoItems('Marital status', 'Married'),
                const SizedBox(height: 5),
                buildInfoItems('Nationality', 'Pakistan'),
                const SizedBox(height: 5),
                buildInfoItems('Emirates ID', 'GT65349'),
                const SizedBox(height: 5),
                buildInfoItems('Expiry Date', '15 Sep, 2025'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInfoItems('Document', 'Doc.pdf'),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDocumentPopup(context, 'Job Description');
                            },
                            child: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorConstants.primaryColor,
                              size: 20,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.download_for_offline,
                          color: ColorConstants.primaryColor,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                )
              ]),
        ),
      ),
    );
  }

  Widget buildJobDetails(BuildContext context) {
    return Card(
      elevation: 5,
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
              title: addText('Job Details', getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                buildInfoItems('Designation', 'Driver'),
                buildInfoItems('Date of Employment', '23 May, 2019'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildVerticalItems('Driving License', 'GTS8995344'),
                    verticalDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildVerticalItems('Expiry Date', '15 Sep, 2024'),
                        SizedBox(
                          width: 8.w,
                        ),
                        GestureDetector(
                            onTap: () {
                              showPicker(context);
                            },
                            child: Icon(
                              Icons.calendar_month,
                              color: ColorConstants.primaryColor,
                              size: getHeadingTextFontSIze(),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Driving_license.doc', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.normal),
                    GestureDetector(
                        onTap: () {
                          showDocumentPopup(context, 'Driving Licence');
                        },
                        child: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: ColorConstants.primaryColor,
                        ))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: addText('Job Title', getSubheadingTextFontSIze(),
                        ColorConstants.black, FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.primaryColor),
                      borderRadius: getBorderRadius()),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ic_driver.svg',
                        height: getLargeTextFontSIze(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      addText('Driver', getNormalTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.normal)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Employment Certificate', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDocumentPopup(
                                  context, 'Employment Certificate');
                            },
                            child: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorConstants.primaryColor,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.download_for_offline,
                          color: ColorConstants.primaryColor,
                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Salary Certificate', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDocumentPopup(context, 'Salary Certificate');
                            },
                            child: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorConstants.primaryColor,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.download_for_offline,
                          color: ColorConstants.primaryColor,
                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Job Description', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDocumentPopup(context, 'Job Description');
                            },
                            child: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorConstants.primaryColor,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.download_for_offline,
                          color: ColorConstants.primaryColor,
                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: ColorConstants.primaryColor,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.salarySlipView);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('Salary Slip', getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.bold),
                      const Icon(
                        Icons.arrow_forward,
                        color: ColorConstants.primaryColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }

  Widget buildFamilyInfo(BuildContext context) {
    return Card(
      elevation: 5,
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
              title: addText('Family Info', getHeadingTextFontSIze(),
                  ColorConstants.black, FontWeight.bold),
              backgroundColor: ColorConstants.white,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText("Family Members", getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    GestureDetector(
                      onTap: () {
                        controller.addFamilyMemberHeader.value =
                            'Add Family Member';
                        Get.toNamed(Routes.addFamilyMember);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColorLight,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: ColorConstants.primaryColor)),
                        child: Icon(
                          Icons.add,
                          color: ColorConstants.primaryColor,
                          size: getHeadingTextFontSIze(),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildFamilyItem(index, context);
                  },
                ),
              ]),
        ),
      ),
    );
  }

  Widget buildVerticalItems(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addText(title, getSmallTextFontSIze(), ColorConstants.black,
              FontWeight.normal),
          addText(description, getSmallTextFontSIze(),
              ColorConstants.primaryColor, FontWeight.bold),
        ],
      ),
    );
  }

  Widget buildFamilyItem(int index, BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: ColorConstants.white,
          border: Border.all(color: ColorConstants.primaryColorLight, width: 2),
          borderRadius: getCurvedBorderRadius()),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems('Name', 'Salma Khan'),
                      buildInfoItems('Relation', 'Mother'),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addFamilyMemberHeader.value =
                              'Edit Family Member';
                          Get.toNamed(Routes.addFamilyMember);
                        },
                        child: SvgPicture.asset('assets/images/ic_edit.svg'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDeleteDialog(context, index);
                        },
                        child: SvgPicture.asset('assets/images/ic_delete.svg'),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }

  showDeleteDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,
            scrollable: true,
            insetPadding: const EdgeInsets.all(14),
            title: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: addAlignedText(
                      "Remove Family Member",
                      getSubheadingTextFontSIze(),
                      ColorConstants.black,
                      FontWeight.w600),
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
                      ),
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: getCurvedBorderRadius()),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText('Reason :', getNormalTextFontSIze(),
                        ColorConstants.black, FontWeight.bold),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: ColorConstants.etBgColor,
                          border:
                              Border.all(color: ColorConstants.borderColor2),
                          borderRadius: getEdgyBorderRadius()),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {},
                        child:
                            CircularBorderedButton(width: 35.w, text: 'DELETE'),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
