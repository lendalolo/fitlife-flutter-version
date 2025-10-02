import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/GradintText.dart';
import 'circle_dashed_water_migure_widget.dart';

class WaterRealTimeUpdate extends StatelessWidget {
  final Size media;
  final double totalMl;

  const WaterRealTimeUpdate({
    super.key,
    required this.media,
    required this.totalMl,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> waterArr = getReversedCumulativeWaterPortions(totalMl);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: waterArr.map((wObj) {
        var isLast = wObj == waterArr.last;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleDashedWaterMisureWidget(isLast: isLast, media: media),
            const SizedBox(width: 10),
            WaterQuantitesWithTimeWidget(wObj),
          ],
        );
      }).toList(),
    );
  }

  /// 👇 Generates cumulative values from totalMl down to 0ml across 5 time blocks
  List<Map<String, String>> getReversedCumulativeWaterPortions(double totalMl) {
    List<String> times = [
      "6am - 8am",
      "9am - 11am",
      "11am - 2pm",
      "2pm - 4pm",
      "4pm - now",
    ];

    // Reverse the time blocks to match descending water
    List<String> reversedTimes = times.reversed.toList();

    double step = (totalMl / (reversedTimes.length - 1));

    return List.generate(reversedTimes.length, (index) {
      double currentValue = (totalMl - (step * index)).roundToDouble();
      return {
        "title": reversedTimes[index],
        "subtitle": "${currentValue.toStringAsFixed(0)} L",
      };
    });
  }
}

/// 👇 Renders the subtitle text (amount of water) with gradient style
Column WaterQuantitesWithTimeWidget(Map<String, String> wObj) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Optional: Show the time range
      // Text(wObj["title"].toString(), style: Styles.kFontSize10),
      GradiantText(
        title: wObj["subtitle"].toString(),
        textStyle: Styles.kFontSize12.copyWith(
          color: TColor.white.withOpacity(0.7),
        ),
        linearGradiant: TColor.kwaterTextGradient,
      ),
    ],
  );
}
