import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/utils.dart';

class AboutAppView extends GetView {
  const AboutAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppHeader(
            showBackIcon: true,
            title: 'About App',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    addText(
                      'Ad minim tempor quis consequat fugiat sunt est aliqua. Nisi proident culpa occaecat tempor laborum sit ut consectetur deserunt incididunt do non. Dolor sit enim nulla reprehenderit nisi officia proident et exercitation eu. Enim deserunt mollit duis do. Minim laboris enim in in commodo. Exercitation voluptate deserunt ipsum sunt consectetur Lorem ad sunt. Proident eu sit cupidatat dolor voluptate. Amet veniam eiusmod laboris fugiat ex ex occaecat consequat ut adipisicing sunt nulla. Tempor quis tempor quis ullamco et laboris nostrud. Qui minim nostrud quis fugiat proident. Laboris fugiat in dolore nulla eu adipisicing do culpa nulla nulla sunt. Dolore reprehenderit aute labore in. Sunt anim est aliquip dolore magna officia. Anim eiusmod Lorem mollit irure. Ex velit exercitation in nostrud culpa est. Tempor deserunt do fugiat excepteur exercitation esse adipisicing. Excepteur amet aliquip Lorem consectetur dolore non incididunt nulla quis ullamco quis commodo do.',
                      12,
                      Colors.black,
                      FontWeight.normal,
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
