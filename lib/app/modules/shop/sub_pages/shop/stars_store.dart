import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/controller/shop_internal_controller.dart';
import 'package:stardriver/app/routes/app_routes.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class StarStore extends GetView<ShopInternalController> {
  const StarStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      floatingActionButton: buildFAB(),
      body: Column(
        children: [
          buildCategories(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.borderColor2),
                borderRadius: getBorderRadius()),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorConstants.lightTextColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: addSmallEditText(
                        controller.searchController, 'Search by name'))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 31.h,
                crossAxisSpacing: 10,
                mainAxisSpacing: 1.h),
            itemBuilder: (context, index) => FadeInRight(
              duration: Duration(milliseconds: 200*(index+1)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: index.isEven
                      ?  EdgeInsets.only(left: 20,bottom: 1.h)
                      :  EdgeInsets.only(right: 20,bottom: 1.h),
                  decoration: BoxDecoration(
                      boxShadow: [getDeepBoxShadow()],
                      color: ColorConstants.white,
                      borderRadius: getCurvedBorderRadius()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(
                          controller.imageList[index],
                          height: 20.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText('NFC Tags', getNormalTextFontSIze(), ColorConstants.black, FontWeight.normal),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText('5 AED', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: getCurvedBorderRadius(),
                                  border: Border.all(color: ColorConstants.primaryColor),
                                  color: ColorConstants.primaryColorLight),
                              child: Row(
                                children: [
                                  Icon(Icons.remove,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),
                                  addText(' 2 ', getSmallTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
                                  Icon(Icons.add,color: ColorConstants.primaryColor,size: getHeadingTextFontSIze(),),

                                ],
                              ),
                            )

                          ],),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  Widget buildFAB(){
    return Material(
        type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
        child: Stack(
          children: [
            Ink(
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.primaryColor, width: 2.0),
                color: ColorConstants.primaryColorLight,
                boxShadow: [getDeepBoxShadow()],
                shape: BoxShape.circle,
              ),
              child:  InkWell(
                borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                onTap: (){
                  Get.toNamed(Routes.cartView);
                },
                child: const Padding(
                  padding:EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30.0,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: ColorConstants.primaryColor,
                  shape: BoxShape.circle,
                ),child: addText('3', getSmallestTextFontSIze(), ColorConstants.white, FontWeight.normal),
              ),
            )
          ],
        )
    );
  }

  Widget buildCategories() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE), borderRadius: getBorderRadius()),
      height: 5.h,
      child: ListView.builder(
        itemCount: controller.categoryList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
                onTap: () {
                  controller.selectedCategoryPos.value = index;
                },
                child: Container(
                  height: 4.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  margin: const EdgeInsets.only(
                      right: 5, top: 3, bottom: 3, left: 5),
                  decoration: controller.selectedCategoryPos.value == index
                      ? getPrimaryDecoration2()
                      : null,
                  child: Center(
                      child: addText(
                          controller.categoryList[index],
                          getNormalTextFontSIze(),
                          controller.selectedCategoryPos.value == index
                              ? ColorConstants.primaryColor
                              : ColorConstants.gretTextColor,
                        controller.selectedCategoryPos.value == index
                            ? FontWeight.w700
                            : FontWeight.normal,)),
                ),
              ));
        },
      ),
    );
  }
}
