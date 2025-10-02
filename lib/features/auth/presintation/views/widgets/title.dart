import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
class CustomTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        style: Styles.kFontSize20,
      ),
      Text(
        subTitle,
        textAlign: TextAlign.center,
        style: Styles.kFontSize12.copyWith(color: TColor.gray),
      ),
    ],);
  }
}
