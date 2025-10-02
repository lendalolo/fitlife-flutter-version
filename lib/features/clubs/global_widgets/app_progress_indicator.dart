import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    super.key,
    this.backgroundColor,
    this.color,
    this.value,
    this.strokeCap,
    this.semanticsLabel,
    this.semanticsValue,
    this.valueColor,
    this.strokeAlign,
    this.strokeWidth,
    this.width,
    this.height,
  });

  final Color? backgroundColor;
  final Color? color;
  final double? value;
  final StrokeCap? strokeCap;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double? strokeAlign;
  final double? strokeWidth;
  final Animation<Color?>? valueColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: color ?? context.colorScheme.onPrimary,
        value: value,
        strokeCap: strokeCap,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        strokeAlign: strokeAlign ?? 0.0.r,
        strokeWidth: strokeWidth ?? 3.r,
        valueColor: valueColor,
        key: key,
      ),
    );
  }
}
