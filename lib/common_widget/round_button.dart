import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/GradintText.dart';
import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

enum RoundButtonType { bgGradient, bgSGradient, textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final double? minWidth;
  final FontWeight fontWeight;
  final TextStyle fontStyle ;
  final double? height;

 const RoundButton(
      {super.key,
      required this.title,
      this.fontSize = 16,
      this.elevation = 1,
      this.fontWeight= FontWeight.w700,
      required this.onPressed, this.minWidth=double.maxFinite, this.fontStyle = Styles.kFontSize16, this.height =50});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height:height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      minWidth: minWidth,
      elevation: elevation,
      color: TColor.white,
      child: GradiantText(title: title,textStyle:fontStyle ,),
    );
  }
}
