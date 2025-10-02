import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import '../../../../../common/colo_extension.dart';
class WaterAnimationBrogressBar extends StatelessWidget {
  final double ratio;
  const WaterAnimationBrogressBar({
    super.key,
    required this.media, required this.ratio,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return SimpleAnimationProgressBar(
      height: media.width * 0.7,
      width: media.width * 0.07,
      backgroundColor: Colors.grey.shade100,

      ratio: ratio,
      direction: Axis.vertical,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(15),
      gradientColor: TColor.kcardGradiant, foregroundColor:Colors.purple,
    );
  }
}