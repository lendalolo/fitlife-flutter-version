import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../common/colo_extension.dart';

class CusttomBarGraph extends StatefulWidget {
  final List<String> x;
  final List<num> y;
  final double lengthOfTheBar;

  CusttomBarGraph({
    super.key,
    required this.x,
    required this.y,
    required this.lengthOfTheBar,
  });

  @override
  State<CusttomBarGraph> createState() => _CusttomBarGraphState();
}

class _CusttomBarGraphState extends State<CusttomBarGraph> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    // Calculate chart width for scrolling
    double chartWidth = widget.x.length * 60.0; // 60 per bar (adjustable)

    return Container(
      height: media.width * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      decoration: BoxDecoration(
        color: TColor.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 3),
        ],
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            //from here incease the space betwen the bars
            width: 250,
            height: media.width * 0.5,
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: widget.lengthOfTheBar <= 0 ? 1 : widget.lengthOfTheBar + 1,
                barTouchData: BarTouchData(

                  touchTooltipData: BarTouchTooltipData(
                    tooltipRoundedRadius: 8,

                    tooltipMargin: 8,
                    tooltipPadding: const EdgeInsets.all(6),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: (rod.toY - 1).toStringAsFixed(1),
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  touchCallback: (FlTouchEvent event, barTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          barTouchResponse == null ||
                          barTouchResponse.spot == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                    });
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTitles,
                      reservedSize: 38,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        final style = TextStyle(
                          color: TColor.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        );

                        if (widget.lengthOfTheBar <= 0) return const SizedBox.shrink();
                        double step = (widget.lengthOfTheBar / 3).roundToDouble();
                        if (step == 0) step = 1; // Avoid division by zero
                        if (value % step == 0) {
                          return Text(
                            value.toStringAsFixed(1),
                            style: style,
                            textAlign: TextAlign.left,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: showingGroups(),

              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(widget.y.length, (i) {
    return makeGroupData(
      i,
      widget.y[i].toDouble(),
      i % 2 == 0 ? TColor.secondaryG : TColor.primaryG,
      widget.lengthOfTheBar,
      isTouched: i == touchedIndex,
    );
  });

  BarChartGroupData makeGroupData(
      int x,
      double y,
      List<Color> barColor,
      double lengthOfTheBar, {
        bool isTouched = false,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
            colors: barColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          width: width,

          borderRadius: BorderRadius.circular(60),
          borderSide: isTouched
              ?  BorderSide(color: TColor.primaryColor1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: lengthOfTheBar + 1,
            color: TColor.lightGray,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: TColor.gray,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );

    int index = value.toInt();
    if (index < 0 || index >= widget.x.length) return const SizedBox.shrink();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(widget.x[index], style: style),
    );
  }
}
