import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/colo_extension.dart';
import '../../../generated/assets.dart';
import '../../../global_widgets/icon_and_text_nav_bottom.dart';
import '../../../methoad/gradient_border_printer.dart';

class BottomNavigationBarHomeWidget extends StatelessWidget {
  const BottomNavigationBarHomeWidget({super.key, required this.onItemTapped});

  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: IntrinsicHeight(
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: CustomPaint(
            painter: GradientBorderPainter(
              stroke: 1.5.r,
              radius: 112.r,
              startColor: const Color(0x52FFFFFF),
              endColor: const Color(0x00FFFFFF),
              startAlignment: Alignment.topLeft,
              endAlignment: Alignment.bottomRight,
            ),
            child: Container(
              // color: context.colorScheme.surface,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(112.r),
                gradient: RadialGradient(
                  colors: [
                    TColor.primaryColor2.withOpacity(0.4),
                    TColor.primaryColor1.withOpacity(0.4),
                  ],
                  focalRadius: 0.2,
                  // focal: Alignment(0, 0),
                  center: Alignment.center,
                  radius: 6.r,
                ),
              ),
              padding: REdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconAndTextNavBottom(
                    text: "Gyms",
                    icon: Assets.svgGym,
                    onTap: () {
                      onItemTapped(0);
                    },
                  ),
                  16.horizontalSpace,
                  IconAndTextNavBottom(
                    text: "Map",
                    icon: Assets.svgChat,
                    onTap: () {
                      onItemTapped(1);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
