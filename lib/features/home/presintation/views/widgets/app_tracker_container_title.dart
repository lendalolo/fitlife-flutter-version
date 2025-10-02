import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/GradintText.dart';
class AppTrackerContainerTitle extends StatelessWidget {
  final String title;
  final String gradiantText;
  const AppTrackerContainerTitle({super.key, required this.title, required this.gradiantText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradiantText(title: gradiantText,
          textStyle: Styles.kFontSize14.copyWith( fontWeight: FontWeight.w700,color: TColor.white.withOpacity(0.7)),),
      ],
    );
  }
}
