import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';

import '../../../backend/sp_keys.dart';
import '../../../storage/base_shared_preference.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {

    new Future.delayed(
        const Duration(seconds: 3),
            () =>_init());
    super.initState();
  }
  _init() async{
    Future.delayed(Duration.zero, () => FocusScope.of(context).unfocus());

    final String? userID = await BaseSharedPreference().getString(SpKeys().userId);
    print("userID");
    print(userID);
    var route = Routes.selectLanguageView;
    if (userID != null) {
      route = Routes.baseView;
    }

    Future.delayed(
        const Duration(seconds: 0), () => Get.offAllNamed(route));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Center(
        child: SvgPicture.asset('assets/images/splash_image_1.svg',height: 30.w,width: 30.w,),
      ),
    );
  }
}
