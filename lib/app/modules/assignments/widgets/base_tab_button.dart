import 'package:flutter/material.dart';

import 'base_button.dart';

class BaseTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  const BaseTabButton({Key? key, required this.title, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: BaseButton(title: title,onPressed: null,verticalPadding: 0,isActive: isSelected,isToggle: isSelected, btnType: 'togglelarge',),
      ),
    );
  }
}
