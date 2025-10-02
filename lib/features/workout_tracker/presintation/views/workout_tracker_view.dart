import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/common%20blocs/drawer%20cubit/drawer_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/goals%20widgets/workout_tracker_body.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../home/presintation/views/widgets/custtom_app_bar.dart';


class WorkoutTrackerView extends StatefulWidget {
final AnimationController animationController;
  const WorkoutTrackerView({super.key, required this.animationController});

  @override
  State<WorkoutTrackerView> createState() => _WorkoutTrackerViewState();
}

class _WorkoutTrackerViewState extends State<WorkoutTrackerView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CusttomAppBar(title: AppLocalazations.of(context)!.translate('SelectPage')["Workout Tracker"],
            menuOnTap: (){
         // BlocProvider.of<DrawerBloc>(context).add(DrawerEvent());
         // widget.animationController.forward();
            },),
          SliverAppBar(
            centerTitle: true,
            elevation: 0,
            leadingWidth: 0,
            leading: const SizedBox(),
            expandedHeight: 130,
            flexibleSpace: Container(
              decoration: const BoxDecoration(gradient:  LinearGradient(colors: TColor.primaryG)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
             height: media.width * 0.45,
              width: double.maxFinite,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchCallback:
                        (FlTouchEvent event, LineTouchResponse? response) {
                      if (response == null || response.lineBarSpots == null) {
                        return;
                      }
                    },
                    mouseCursorResolver:
                        (FlTouchEvent event, LineTouchResponse? response) {
                      if (response == null || response.lineBarSpots == null) {
                        return SystemMouseCursors.basic;
                      }
                      return SystemMouseCursors.click;
                    },
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          FlLine(
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
                    touchTooltipData: LineTouchTooltipData(
                      //tooltipBgColor: TColor.secondaryColor1,
                      tooltipRoundedRadius: 20,
                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            "${lineBarSpot.x.toInt()} mins ago",
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: lineBarsData1,
                  minY: -0.5,
                  maxY: 110,
                  titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                      bottomTitles: AxisTitles(
                        sideTitles: bottomTitles,
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: rightTitles,
                      )),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: 25,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: TColor.white.withOpacity(0.15),
                        strokeWidth: 2,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];

      },
      body: WorkoutTrackerBody(media: media),
    ),);
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
            //tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: TColor.white,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: TColor.white.withOpacity(0.5),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: TColor.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.white,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
