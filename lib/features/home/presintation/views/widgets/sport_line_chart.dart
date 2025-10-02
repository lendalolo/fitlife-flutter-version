import 'package:fitness/features/home/presintation/views/widgets/sport_line_bars_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/GradintText.dart';
import '../../../data/models/profile_model.dart';
import '../../views_blocs/sport line chart bloc/sport_line_chart_bloc.dart';
import 'bulid_chart_message_function.dart';
Container SportLineChart({required Size media,required ProfileModel profileModel}) {
  return Container(
    height: media.width * 0.4,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: TColor.primaryColor2.withOpacity(0.3),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Heart Rate",
                style: Styles.kFontSize16,
              ),
              GradiantText(
                title: "78 BPM",
                textStyle: Styles.kFontSize18.copyWith(
                    fontWeight: FontWeight.w700,
                    color: TColor.white.withOpacity(0.7)),
              ),
            ],
          ),
        ),
        BlocBuilder<SportLineChartBloc,SportLineChartState>(builder:(context, state) {
          return LineChart(
            LineChartData(
              showingTooltipIndicators: [
                ShowingTooltipIndicators([
                  LineBarSpot(
                    SportLineBarsData(state,allSpots)[0],
                    0,
                    SportLineBarsData(state,allSpots)[0].spots[state.index],
                  ),
                ])
              ],
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return;
                  }
                  if (event is FlTapUpEvent) {
                    final spotIndex = response.lineBarSpots!.first.spotIndex;
                    BlocProvider.of<SportLineChartBloc>(context).add(SportLineChartEvent(spotIndex));
                  }
                },
                getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      const FlLine(
                        color: Colors.transparent,
                      ),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                              radius: 3,
                              color: Colors.white,
                              strokeWidth: 3,
                              strokeColor: TColor.secondaryColor1,
                            ),
                      ),
                    );
                  }).toList();
                },
                touchTooltipData:buildLineTouchTooltipData(color: TColor.secondaryColor1, text: 'mins ago')
              ),
              lineBarsData: SportLineBarsData(state,allSpots),
              minY: 0,
              maxY: 130,
              titlesData: const FlTitlesData(show: false,),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(
                show: false,
              ),
            ),
          );
        },),
      ],
    ),
  );
}