
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/colo_extension.dart';
import '../../views_blocs/sport line chart bloc/sport_line_chart_bloc.dart';

List<LineChartBarData> SportLineBarsData(SportLineChartState state,List<FlSpot> spots) {
  final lineBarsData = [
    LineChartBarData(
      showingIndicators: [state.index],
      spots: spots,
      isCurved: false,
      barWidth: 2,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(colors: [
          TColor.primaryColor2.withOpacity(0.7),
          TColor.primaryColor1.withAlpha(7),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: TColor.primaryG,
      ),
    ),
  ];
  return lineBarsData;
}

List<FlSpot> get allSpots => const [
  FlSpot(0, 20),
  FlSpot(1, 25),
  FlSpot(2, 40),
  FlSpot(3, 50),
  FlSpot(4, 35),
  FlSpot(5, 40),
  FlSpot(6, 30),
  FlSpot(7, 20),
  FlSpot(8, 25),
  FlSpot(9, 40),
  FlSpot(10, 50),
  FlSpot(11, 35),
  FlSpot(12, 50),
  FlSpot(13, 60),
  FlSpot(14, 40),
  FlSpot(15, 50),
  FlSpot(16, 20),
  FlSpot(17, 25),
  FlSpot(18, 40),
  FlSpot(19, 50),
  FlSpot(20, 35),
  FlSpot(21, 80),
  FlSpot(22, 30),
  FlSpot(23, 20),
  FlSpot(24, 25),
  FlSpot(25, 40),
  FlSpot(26, 50),
  FlSpot(27, 35),
  FlSpot(28, 50),
  FlSpot(29, 60),
  FlSpot(30, 40)
];