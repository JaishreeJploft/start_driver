import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'custom_dialog.dart';

openPointsAddedRemovedDialog({bool added = true}) {
  showCustomDialog(
    Get.context!,
    title: '',
    padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
    children: [
      Center(
        child: SvgPicture.asset(
          'assets/images/active_checkbox_shadow.svg',
          height: 60,
        ),
      ),
      const SizedBox(
        height: 18,
      ),
      Center(
        child: Text(
          'Points ${added ? 'Added' : 'Removed'} Successfully.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

      ),
    ],
  );
}
