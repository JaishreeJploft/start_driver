import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/sos_assembly_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/rich_text.dart';
import 'package:stardriver/common/tab.dart';
import 'package:stardriver/common/utils.dart';
import '../../../common/app_header.dart';


class SosAssemblyView extends GetView<SosAssemblyController> {
  const SosAssemblyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    

    return Obx(
      () => Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      dropDown(),
                       SizedBox(height: 2.h),
                      Text(
                        'You are a warden',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      fireAlarmBox(),
                      const SizedBox(height: 20),
                      Obx(
                        () => GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.3,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  controller.changeActiveBox('remaining'),
                              child: singleBox(
                                title: '50/800',
                                description: 'Remaining for Evacuation',
                                isActive:
                                    controller.activeBox.value == 'remaining',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.changeActiveBox('fire'),
                              child: singleBox(
                                title: '20',
                                description: 'Need Help',
                                isActive: controller.activeBox.value == 'fire',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => controller.activeBox.value == 'remaining'
                            ? remainingTab()
                            : needTab(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: controller.showFloatingButton.value ||
                controller.activeBox.value == 'fire'
            ? Container()
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FloatingActionButton(
                      backgroundColor: ColorConstants.primaryColorLight,
                      shape:  const StadiumBorder(
                        side: BorderSide(
                          color: ColorConstants.primaryColor,
                          width: 1,
                        ),
                      ),
                      onPressed: () {
                        // clinicVisitRequestDialog(context);
                        Get.toNamed(Routes.askForHelpView);
                      },
                      child: const Icon(Icons.add,size: 30,color: ColorConstants.primaryColor,),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Transform.translate(
                        offset: const Offset(0, 0),
                        child: const Text(
                          'Need Help',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            // fontFamily: FontFamily.arial,
                          ),
                        ),
                      )),
                ],
              ),
      ),
    );
  }

  Container fireAlarmBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        color: const Color(0XFFE62626),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/accident.svg',color: ColorConstants.yellow,
              width: 90, height: 90,
            ),
            const SizedBox(height: 10),
            Text(
              'Bus Accident',
              style: TextStyle(
                fontSize: getLargeTextFontSIze() + 5.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dropDown() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: ColorConstants.secondaryColor,
        borderRadius: getBorderRadius(),
        border: Border.all(
          color: const Color(0XFFBECADA),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'Assembly Point 1',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelStyle: TextStyle(
              color: Colors.black,
              // fontSize: getNormalSmallTextFontSIze(),
            ),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Assembly Point 1',
              child: Text('Assembly Point 1'),
            ),
            DropdownMenuItem(
              value: 'School 1',
              child: Text('School 1'),
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget singleBox(
      {String? title, String? description, required bool isActive}) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: isActive ? ColorConstants.secondaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? ColorConstants.primaryColor : Colors.white,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF000000).withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title!.capitalizeFirst!,
                    style: TextStyle(
                      // fontFamily: FontFamily.arial,
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description!.capitalizeFirst!,
                    style: TextStyle(
                      // fontFamily: FontFamily.arial,
                      color: const Color(0XFF303030),
                      fontSize: 14.5.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: isActive
                ? SvgPicture.asset('assets/images/active_checkbox.svg')
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget otherSingleBox({bool active = false, required String icon}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: active ? ColorConstants.secondaryColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: active ? ColorConstants.secondaryColor : const Color(0XFFBECADA),
          width: 1,
        ),
        boxShadow: [
          active
              ? BoxShadow(
                  color: const Color(0XFF000000).withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 4), // changes position of shadow
                )
              : const BoxShadow(),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(active
              ? 'assets/images/active_checkbox.svg'
              : 'assets/images/inactive_checkbox.svg'),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset(
              icon,
              width: 25,
              color: active ? ColorConstants.primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  remainingTab() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 10),
          tabs(),
          const SizedBox(height: 20),
          search(
            icon: SvgPicture.asset(
              'assets/images/${controller.activeTab.value}.svg',
              width: 30,
              color: ColorConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          tab(),
          const SizedBox(height: 15),
          Obx(
            () => controller.currentTab.value == 'remaining'
                ? remanningTab()
                : stampedTab(),
          ),
        ],
      ),
    );
  }

  needTab() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 20),
          tabs(),
          const SizedBox(height: 30),
          search(
            icon: SvgPicture.asset(
              'assets/images/${controller.activeTab.value}.svg',
              width: 30,
              color: ColorConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              checkTile(isNeedTab: true),
              checkTile(isNeedTab: true),
              checkTile(isNeedTab: true),
            ],
          )
        ],
      ),
    );
  }

  Widget tabs() {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeActiveTab('nfc'),
              child: otherSingleBox(
                active: controller.activeTab.value == 'nfc',
                icon: 'assets/images/nfc.svg',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeActiveTab('barcode'),
              child: otherSingleBox(
                active: controller.activeTab.value == 'barcode',
                icon: 'assets/images/barcode.svg',
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeActiveTab('hand'),
              child: otherSingleBox(
                active: controller.activeTab.value == 'hand',
                icon: 'assets/images/hand.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget search({Widget icon = const SizedBox()}) {
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: SvgPicture.asset(
            'assets/images/search-black.svg',
            width: 20,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            if (controller.activeTab.value == 'barcode') {
              Get.toNamed(Routes.qrScanner);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: controller.activeTab.value == 'hand' ? const SizedBox() : icon,
          ),
        ),
        hintText: 'Search By ID...',
        hintStyle:  TextStyle(
          color: Colors.black,
          fontSize: getNormalTextFontSIze()
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0XFFbecada),
          ),
        ),
      ),
    );
  }

  Widget tab() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: tabButton(
              title: 'Remaining',
              onTap: () => controller.changeTab('remaining'),
              isSelected: controller.currentTab.value == 'remaining',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: tabButton(
              title: 'Stamped',
              onTap: () => controller.changeTab('stamped'),
              isSelected: controller.currentTab.value == 'stamped',
            ),
          ),
        ],
      ),
    );
  }

  remanningTab() {
    return (controller.activeTab.value == 'nfc' ||
                controller.activeTab.value == 'barcode') &&
            controller.currentTab.value == 'remaining'
        ? Column(
            children: [
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                girl: false,
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                girl: false,
              ),
            ],
          )
        : Column(
            children: [
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
                girl: false,
              ),
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
              ),
              checkTile(
                hand: true,
                name: 'Abdul Khan',
                id: '#632541',
                girl: false,
              ),
            ],
          );
  }

  stampedTab() {
    return Obx(() => controller.activeTab.value == 'nfc' ||
            controller.activeTab.value == 'barcode'
        ? Column(
            children: [
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                address: 'Assembly Point No. 2',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                girl: false,
                address: 'Assembly Point No. 3',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                address: 'Assembly Point No. 2',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                address: 'Assembly Point No. 3',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                address: 'Assembly Point No. 2',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                address: 'Assembly Point No. 3',
              ),
              checkTile(
                name: 'Abdul Khan',
                id: '#632541',
                girl: false,
                address: 'Assembly Point No. 2',
              ),
            ],
          )
        : Column(
            children: [
              checkTile(
                isChangeStatus: true,
                hand: true,
                name: 'Abdul Khan',
                girl: false,
              ),
              checkTile(isChangeStatus: true, hand: true),
            ],
          ));
  }

  Widget checkTile({
    String? address,
    bool hand = false,
    bool isNeedTab = false,
    bool tap = true,
    String name = 'Abdul Khan',
    String id = '#632541',
    bool girl = true,
    bool isChangeStatus = false, 
  }) {
    return GestureDetector(
      onTap: () => tap ? openHelpDialog() : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: getBorderRadius(),
          border: Border.all(
            color: isNeedTab ? const Color(0XFFE62626) : const Color(0XFFC9C9C9),
            width: 1,
          ),
        ),
        child: Padding(
          padding: isChangeStatus
              ? const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                )
              : const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: isNeedTab ? 1 : 1.06,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorConstants.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              girl
                                  ? 'assets/images/user.svg'
                                  : 'assets/images/user.svg',
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: getNormalTextFontSIze(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          id,
                          style: TextStyle(
                            fontSize: getNormalTextFontSIze(),
                            color: ColorConstants.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isChangeStatus
                            ? SizedBox(
                                width: Get.width - 275,
                                child: richTile(
                                  title: 'Assembly Point No. 3',
                                  value: '',
                                  icon: 'assets/images/location-pin.svg',
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              address != null
                  ? Container(
                      height: 50,
                      width: 1,
                      color: const Color(0XFFD9D9D9),
                    )
                  : Container(),
              address != null
                  ? const SizedBox(
                      height: 1,
                      width: 10,
                    )
                  : Container(),
              address != null
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/location-pin.svg',
                          height: 15,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: Get.width - 285,
                          child: const Text(
                            'Assembly Point No. 2',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              isNeedTab
                  ? Container(
                      height: 50,
                      width: 1,
                      color: const Color(0XFFD9D9D9),
                    )
                  : Container(),
              isNeedTab
                  ? const SizedBox(
                      height: 1,
                      width: 10,
                    )
                  : Container(),
              isNeedTab
                  ? Column(
                      children: [
                        const Text(
                          'Reported Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0XFF929292),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/location-pin.svg',
                              height: 15,
                            ),
                            const SizedBox(width: 10),
                            const Text('Lab01-F1', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    )
                  : Container(),
              Row(
                children: [
                  hand
                      ? Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0XFFDCDCDC),
                                offset: Offset(0, 1),
                                blurRadius: 1,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              isChangeStatus ? 'Change Status' : 'Stamp',
                              style: const TextStyle(
                                color: Color(0XFF5F5F5F),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openHelpDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            // height: 300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -15),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Help Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(Get.width - 110, -15),
                          child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                  ),
                  checkTile(isNeedTab: false, tap: false),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      Text(
                        'Reported Location',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF929292),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/location-pin.svg',
                        height: 15,
                      ),
                      const SizedBox(width: 10),
                      const Text('Classroom 43'),
                    ],
                  ),
                  const Divider(
                    color: Color(0XFFD9D9D9),
                    thickness: 1,
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'I\'m stuck at my location\nPlease help me I\'m unable to evacuate the classroom. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
