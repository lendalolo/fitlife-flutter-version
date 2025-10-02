import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class CusttomCircleDashItemCount extends StatelessWidget {
  const CusttomCircleDashItemCount({
    super.key,
    required this.isLast, required this.color, required this.height,
  });

  final bool isLast;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              border: Border.all(color: TColor.white, width: 3),
              borderRadius: BorderRadius.circular(9),
            ),) ,
        ),
        if (!isLast)
          DottedDashedLine(
              height: height,
              width: 0,
              dashColor: color,
              axis: Axis.vertical)
      ],
    );
  }
}