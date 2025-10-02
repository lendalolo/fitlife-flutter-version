import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:fitness/features/clubs/common/themes/extension_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';
import 'app_inkwell_widget.dart';
import 'app_text.dart';

class IconAndTextNavBottom extends StatelessWidget {
  const IconAndTextNavBottom(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTap});

  final String text;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: RPadding(
        padding: REdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage.asset(
              icon,
              height: 32.r,
              width: 32.r,
              color: context.colorScheme.lowestEmphases,
            ),
            AppText.buttonSmall(
              text,
              color: context.colorScheme.lowestEmphases,
            )
          ],
        ),
      ),
    );
  }
}
