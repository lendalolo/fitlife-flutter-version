

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';

List<PieChartSectionData> showingSections({required double value}) {
  return List.generate(
    2,
        (i) {
      var color0 = TColor.secondaryColor1;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: color0,
              value: value,
              title: '',
              radius: 55,
              titlePositionPercentageOffset: 0.55,
              badgeWidget:  Text(
                "${value}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ));
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 75,
            title: '',
            radius: 45,
            titlePositionPercentageOffset: 0.55,
          );

        default:
          throw Error();
      }
    },
  );
}