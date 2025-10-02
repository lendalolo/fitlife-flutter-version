import 'package:fl_chart/fl_chart.dart';
import'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
LineTouchTooltipData buildLineTouchTooltipData({ required Color color,required String text,}) {
  return LineTouchTooltipData(
    getTooltipColor: (touchedSpot) => color,
    tooltipRoundedRadius: 20,
    getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
      return lineBarsSpot.map((lineBarSpot) {
        return LineTooltipItem(
          "${lineBarSpot.x.toInt()} $text",
          Styles.kFontSize10.copyWith(color: TColor.white,fontWeight: FontWeight.w700),
        );
      }).toList();
    },
  );}