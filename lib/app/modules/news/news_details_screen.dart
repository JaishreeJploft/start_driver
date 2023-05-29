import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';

class NewsDetailScreen extends StatefulWidget {
  final bool isShowAcknowledge;
  const NewsDetailScreen({Key? key,this.isShowAcknowledge=true}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppHeader(
            showBackIcon: true,

            title: '',
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            addAlignedText("Principal’s Honouring Ceremony", 20, const Color(0xFF072D4B), FontWeight.w700),
            SizedBox(height: 3.h,),
            addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam.", 17, const Color(0xFF072D4B).withOpacity(0.6), FontWeight.w400),
            SizedBox(height: 3.h,),
            Row(
              children: [
                addText("School Admin", 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
                SizedBox(width: 3.w  ,),
                addText("15 mins ago", 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
              ],
            ),
            SizedBox(height: 6.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                !widget.isShowAcknowledge ?Flexible(
                  child: InkWell(
                    onTap: (){
                    },
                    child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xFFBECADA), width: 1.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
                          child: addText('ACKNOWLEDGE', getNormalTextFontSIze(), ColorConstants.gretTextColor, FontWeight.bold),
                        )
                    ),
                  ),
                ):Flexible(
                  child: InkWell(
                    onTap: (){
                    },
                    child: Card(
                        elevation: 4,
                        color: ColorConstants.primaryColorLight,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: ColorConstants.primaryColor, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
                          child: addText('AGREED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                        )
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
