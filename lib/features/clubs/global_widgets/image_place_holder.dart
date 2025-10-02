import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'app_image.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.onSurfaceVariant,
      highlightColor: context.colorScheme.surface,
      child: Center(
        child: AppImage.asset(
          'assets/pngs/place_holder.png',
          width: width,
          // height: height*.7,
        ),
      ),
    );
  }
}
