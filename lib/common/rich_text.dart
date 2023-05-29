import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardriver/common/color_constants.dart';

Row richTile({
  String? icon,
  double iconSize = 13,
  required String title,
  required String value,
  decoration = false,
  TextStyle? titleStyle,
  TextStyle? valueStyle,
  bool isCenter = false,
  double? maxLines,
  WidgetSpan? widgetSpan,
  double height = 1,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      icon != null
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SvgPicture.asset(
                    icon,
                    height: iconSize,
                    width: iconSize,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            )
          : Container(),
      Expanded(
        child: RichText(
          maxLines: maxLines?.toInt(),
          overflow: TextOverflow.ellipsis,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: title.isEmpty ? '' : '$title : ',
                style: titleStyle ?? const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        // fontFamily: FontFamily.arial,
                      ),
              ),
              TextSpan(
                text: value,
                style: valueStyle ?? TextStyle(
                        height: height,
                        fontSize: 14,
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w700,
                        // fontFamily: FontFamily.arial,
                        decoration:
                            decoration ? TextDecoration.underline : null,
                      ),
              ),
              widgetSpan ?? const WidgetSpan(child: SizedBox()),
            ],
          ),
        ),
      ),
    ],
  );
}
