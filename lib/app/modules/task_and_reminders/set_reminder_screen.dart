
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/task_reminder_controller.dart';
import 'package:stardriver/common/bordered_button.dart';
import 'package:stardriver/common/time_picker.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/my_textform_field.dart';
import '../../../common/radio_button.dart';
import '../../../common/utils.dart';


class SetReminderView extends GetView<TaskAndReminderController>{
  const SetReminderView({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar:

      PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child:  AppHeader(
            showBackIcon: true,
            title: controller.isEdit ? 'Edit Task or Remainders' : 'Add Task or Remainders',
          )),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          SizedBox(height: 1.5.h,),
          addText("When to Remind?", 16, Colors.black, FontWeight.normal),
          SizedBox(height: 1.5.h,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => CustomRadioButton(onChange: (value){
                    controller.getremainderValue(value,false);
                  }, groupValue: controller.remainder.value, radiovalue: "daily", radioText: "Daily")),
                  SizedBox(width: 2.h,),
                  Obx(() => CustomRadioButton(onChange: (value){
                    controller.getremainderValue(value,false);
                  }, groupValue: controller.remainder.value, radiovalue: "specificdays", radioText: "Specific Days")),
                  SizedBox(width: 2.h,),
                  Obx(() => CustomRadioButton(onChange: (value){
                    controller.getremainderValue(value,true);
                  }, groupValue: controller.remainder.value, radiovalue: "specificdate", radioText: "Specific Date")),
                ],
              ),
              Obx(() => controller.remainder.value == "specificdays" ? Card(
                shape: RoundedRectangleBorder(borderRadius: getCustomBorderRadius(15)),
                margin: const EdgeInsets.only(top: 15),
                child:  GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: MediaQuery.of(context).size.height*0.03,
                  ),
                  itemCount: controller.specficdaylist.length,
                  itemBuilder: (context, index) =>
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Transform.scale(
                              scale: 0.8,
                              child: Container(
                                width: 20,
                                child: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: controller.specficdaylistoption.contains(controller.specficdaylist[index]),
                                  activeColor: ColorConstants.bgColor,
                                  checkColor: ColorConstants.primaryColor,
                                  side: MaterialStateBorderSide.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return const BorderSide(color: ColorConstants.primaryColor);
                                      }
                                      return const BorderSide(color: ColorConstants.primaryColor);
                                    },
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  onChanged: (value) {
                                    if (controller.specficdaylistoption.contains(controller.specficdaylist[index])) {
                                      controller.addDayList(controller.specficdaylist[index],false);// unselect
                                    } else {
                                      controller.addDayList(controller.specficdaylist[index],true);// select
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          addarialText(controller.specficdaylist[index], Colors.black, 14, FontWeight.normal)
                          ////SizedBox/Text
                        ], //<Widget>[]
                      ), //R
                ),
              ) : const SizedBox.shrink()),
              Obx(() => TimePickerDialogs(initialTime: TimeOfDay.now(),isShowdate: controller.isShowDate.value,)),
              // Obx(() => controller.remainder.value != "specificdays" ? Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     DatePicker(
              //       DateTime.now(),
              //       initialSelectedDate: DateTime.now(),
              //       selectionColor: Colors.white,
              //       selectedTextColor: Colors.black,
              //       monthTextStyle: const TextStyle(color: Color(0xFF7E7E7E),fontSize: 10),
              //       dateTextStyle: const TextStyle(color: Color(0xFF7E7E7E),fontSize: 20),
              //       dayTextStyle: const TextStyle(color: Color(0xFF7E7E7E),fontSize: 10),
              //       onDateChange: (date) {
              //         // New date selected
              //         // setState(() {
              //         //   _selectedValue = date;
              //         // });
              //       },
              //     ),
              //   ],
              // ): const SizedBox.shrink()),
              // Obx(() => controller.remainder.value != "specificdays" ? const SizedBox(height: 15,) : const SizedBox.shrink()),
            ],
          ),
          MyTextFormFieldwithradius(controller: controller.reminderController, titleText: "",hintText: "Reminder Text...",maxLines: 4,),
          MyTextFormFieldwithradius(controller: controller.uploadfileController, titleText: "",hintText: "Upload File or Photo",
            suffix: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset("assets/images/ic_upload.svg"),
            ),),
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: (){},
              child: BorderedButton(width: 0, text: 'SET REMINDER'),
            ),
          ),
          SizedBox(height: 3.h,),
        ],
      ),
    );
  }

}

