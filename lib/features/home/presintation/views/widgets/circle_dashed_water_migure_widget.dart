import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';

class CircleDashedWaterMisureWidget extends StatelessWidget {
  const CircleDashedWaterMisureWidget({
    super.key,
    required this.isLast,
    required this.media,
  });

  final bool isLast;
  final Size media;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
          const EdgeInsets.symmetric(vertical: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: TColor.secondaryColor1.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        if (!isLast)
          DottedDashedLine(
              height: media.width * 0.09,
              width: 0,
              dashColor: TColor.secondaryColor1.withOpacity(0.5),
              axis: Axis.vertical)
      ],
    );
  }
}