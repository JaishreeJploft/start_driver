import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color enableColor;
  final Color disableColor;
  final double width;
  final double height;
  final double switchHeight;
  final double switchWidth;
  final ValueChanged<bool> onChanged;

  const CustomSwitch(
      {required Key key,
      required this.value,
      required this.enableColor,
      required this.disableColor,
      required this.width,
      required this.height,
      required this.switchHeight,
      required this.switchWidth,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 4.h,
            height: 2.2.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: widget.value
                  ? Border.all(color: ColorConstants.primaryColor, width: 0)
                  : null,
              color: _circleAnimation.value == Alignment.centerLeft
                  ? ColorConstants.lightGreyColor
                  : ColorConstants.primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.1.h, bottom: 0.1.h, right: 0.25.h, left: 0.25.h),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 1.8.h,
                  height: 1.8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: widget.value
                        ? ColorConstants.white
                        : ColorConstants.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    /*return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 48.0,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: widget.value
                  ? Border.all(color: StarColors.yellowPrimary)
                  : null,
              color: _circleAnimation.value == Alignment.centerLeft
                  ? widget.disableColor
                  : widget.enableColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: widget.value ? Colors.white : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );*/
  }
}
