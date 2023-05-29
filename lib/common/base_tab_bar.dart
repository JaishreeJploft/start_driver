import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/utils.dart';

class BaseTabBar extends StatelessWidget {
  final TabController? tabController;
  final Function(int index)? onTap;
  final List<Widget> tabList;
  const BaseTabBar({Key? key, this.tabController, this.onTap,required this.tabList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10)
      ),
      child: TabBar(
        controller:tabController,
        padding: EdgeInsets.all(0.5.h),
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF8F4E9),
            boxShadow: const [BoxShadow(
              color: Colors.black38,
              offset: Offset(
                0.0,
                1.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 0.0,
            )]
        ),
        onTap: onTap,
        labelColor: const Color(0xffC19444),
        labelStyle: TextStyle(color: const Color(0xffC19444),fontSize: getNormalTextFontSIze(),fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(color: Colors.black,fontSize: getNormalTextFontSIze(),fontWeight: FontWeight.w400),
        unselectedLabelColor: Colors.black,
        tabs: tabList,
      ),
    );
  }
}
