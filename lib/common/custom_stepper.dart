import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/seperator.dart';
import 'package:stardriver/common/utils.dart';


class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final List<String> _statuses;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = const Color(0xFFE6EEF3);
  final double lineWidth = 3.0;

  const StepProgressView(
      {Key? key,
        required int curStep,
        required List<String> titles,
        required double width,
        required Color color,
        required List<String> statuses})
      : _titles = titles,
        _curStep = curStep,
        _width = width,
        _statuses = statuses,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: statusViews(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: _iconViews(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor = (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor = (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      list.add(
        Container(
          width: 25.0,
          height: 25.0,
          padding: const EdgeInsets.all(0),
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(22.0)),
            border:  Border.all(
              color: ColorConstants.white,
              width: 2.0,
            ),
            boxShadow: [getDeepBoxShadow()],
            color: circleColor
          ),
          child: const Icon(
            Icons.check,
            color: ColorConstants.white,
            size: 12.0,
          ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(const Expanded(
            child: MySeparator(color: ColorConstants.lightTextColor),));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(addText(text, getSmallTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal));
    });
    return list;
  }


  List<Widget> statusViews() {
    var list = <Widget>[];
    _statuses.asMap().forEach((i, text) {
      list.add(addAlignedText(text, getSmallTextFontSIze(), ColorConstants.black, FontWeight.bold));
    });
    return list;
  }

}