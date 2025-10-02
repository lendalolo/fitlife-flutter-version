import 'package:fl_chart/fl_chart.dart';

import '../../../../../common/colo_extension.dart';

LineChartBarData  lineChartBarData1_1(List<FlSpot> spots) {
  return LineChartBarData(
      isCurved: true,
      gradient:TColor.lineChartGradient,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      spots: spots
  );
}

LineChartBarData  lineChartBarData1_2(List<FlSpot> spots) {
  return LineChartBarData(
    isCurved: true,
    gradient: TColor.SecondraylineChartGradient,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData:const FlDotData(show: false),
    spots:spots,
  );
}