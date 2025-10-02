import 'package:fitness/features/home/presintation/views/widgets/sport_line_bars_data.dart';
import 'package:fitness/features/home/presintation/views/widgets/sport_line_chart.dart';
import 'package:fitness/features/home/presintation/views/widgets/today_target_widget.dart';
import 'package:fitness/features/home/presintation/views/widgets/workoutProgressWidget.dart';
import 'package:fitness/features/home/presintation/views/widgets/workout_progress_lines_datas.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../../../common_widget/custtom_bar_graph.dart';
import '../../../../../common_widget/workout_row.dart';
import '../../../../workout_tracker/presintation/views/exercies_couter_view.dart';
import '../../../data/models/profile_model.dart';
import '../../../finished_workout_view.dart';
import '../../views_blocs/sport line chart bloc/sport_line_chart_bloc.dart';
import 'add_flpoints.dart';
import 'bmi_calculate.dart';
import 'bulid_chart_message_function.dart';
import 'home_page_app_bar.dart';
import 'megerments_widgets.dart';

class ProfileStatisticsSuccessBody extends StatelessWidget {
  const ProfileStatisticsSuccessBody({
    super.key,
    required this.media,
    required this.dataStateList,
  });

  final Size media;
  final ProfileModel dataStateList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomePageAppBar(),
        const SizedBox(
          height: 20,
        ),
        BMICalculate(dataStateList,context),
        const SizedBox(
          height: 25,
        ),
        TodayTargetWidget(
          text: AppLocalazations.of(context)!.translate("Profile")["Today Target"],
          ontap: () {
            GoRouter.of(context).pushNamed(Names.ActivityTrackerView);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalazations.of(context)!.translate("Profile")[ "Activity Status"],
          style: Styles.kFontSize16,
        ),
        const SizedBox(
          height: 8,
        ),
        // IconButton(onPressed: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (_) => const CountdownPage()),
        //   );
        // }, icon: Icon(Icons.add)),
       // SportLineChart(media,),
        CusttomBarGraph(
          x: dataStateList.calorex!,
          y: dataStateList.calorey!,
          lengthOfTheBar: dataStateList.maxOfYCal.toDouble(),
        ),
        const SizedBox(
          height: 20,
        ),
        MegermentsWidgets(media: media, profileModel: dataStateList,),
        SizedBox(
          height: media.width * 0.1,
        ),
        Text(
          AppLocalazations.of(context)!.translate("Profile")[ "Food Caloric"],
          style: Styles.kFontSize16,
        ),
        SizedBox(
          height: media.width * 0.05,
        ),
        CusttomBarGraph(
          x: dataStateList.foodx!,
          y: dataStateList.foody!, lengthOfTheBar: dataStateList.maxOfYFood!.toDouble(),

        ),
        // WorkOutProgressWdgit(),
        // SizedBox(
        //   height: media.width * 0.05,
        // ),
        // Container(
        //     padding: const EdgeInsets.only(left: 15),
        //     height: media.width * 0.5,
        //     width: double.maxFinite,
        //     child: BlocBuilder<SportLineChartBloc, SportLineChartState>(
        //       builder: (context, state) {
        //         return LineChart(
        //           LineChartData(
        //             showingTooltipIndicators: [
        //               ShowingTooltipIndicators([
        //                 LineBarSpot(
        //                   SportLineBarsData(state, points[0])[0],
        //                   0,
        //                   SportLineBarsData(state, points[0])[0]
        //                       .spots[state.index],
        //                 ),
        //                 LineBarSpot(
        //                   SportLineBarsData(state, points[1])[0],
        //                   0,
        //                   SportLineBarsData(state, points[1])[0]
        //                       .spots[state.index],
        //                 )
        //               ])
        //             ],
        //             lineTouchData: LineTouchData(
        //               enabled: true,
        //               handleBuiltInTouches: false,
        //               touchCallback:
        //                   (FlTouchEvent event, LineTouchResponse? response) {
        //                 if (response == null || response.lineBarSpots == null) {
        //                   return;
        //                 }
        //                 if (event is FlTapUpEvent) {
        //                   // final spotIndex = response.lineBarSpots!.last.spotIndex;
        //                   final spotIndex =
        //                       response.lineBarSpots!.first.spotIndex;
        //                   BlocProvider.of<SportLineChartBloc>(context)
        //                       .add(ExcerciesProgressChartEvent(spotIndex));
        //                 }
        //               },
        //               touchTooltipData: buildLineTouchTooltipData(
        //                   color: TColor.primaryColor1, text: 'day'),
        //             ),
        //             lineBarsData: lineBarsData1,
        //             minY: -0.5,
        //             maxY: 110,
        //             titlesData: FlTitlesData(
        //                 show: true,
        //                 leftTitles: const AxisTitles(),
        //                 topTitles: const AxisTitles(),
        //                 bottomTitles: AxisTitles(
        //                   sideTitles: bottomTitles,
        //                 ),
        //                 rightTitles: AxisTitles(
        //                   sideTitles: rightTitles,
        //                 )),
        //             gridData: FlGridData(
        //               show: true,
        //               drawHorizontalLine: true,
        //               horizontalInterval: 25,
        //               drawVerticalLine: false,
        //               getDrawingHorizontalLine: (value) {
        //                 return FlLine(
        //                   color: TColor.gray.withOpacity(0.15),
        //                   strokeWidth: 2,
        //                 );
        //               },
        //             ),
        //             borderData: FlBorderData(
        //               show: false,
        //             ),
        //           ),
        //         );
        //       },
        //     )),
        SizedBox(
          height: media.width * 0.05,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "Latest Workout",
        //       style: TextStyle(
        //           color: TColor.black,
        //           fontSize: 16,
        //           fontWeight: FontWeight.w700),
        //     ),
        //     TextButton(
        //       onPressed: () {},
        //       child: Text(
        //         "See More",
        //         style: TextStyle(
        //             color: TColor.gray,
        //             fontSize: 14,
        //             fontWeight: FontWeight.w700),
        //       ),
        //     )
        //   ],
        // ),
        // ListView.builder(
        //     padding: EdgeInsets.zero,
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: dataStateList.length,
        //     itemBuilder: (context, index) {
        //       var wObj = dataStateList[index] as Map? ?? {};
        //       return InkWell(
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => const FinishedWorkoutView(),
        //               ),
        //             );
        //           },
        //           child: WorkoutRow(wObj: wObj));
        //     }),
        SizedBox(
          height: media.width * 0.1,
        ),
      ],
    );
  }
}

LineTouchData get lineTouchData1 => LineTouchData(
  handleBuiltInTouches: true,
  touchTooltipData: LineTouchTooltipData(),
);

List<LineChartBarData> get lineBarsData1 => [
  lineChartBarData1_1(points[0]),
  lineChartBarData1_2(points[1]),
];

List<List<FlSpot>> points = [
  addFlSpots([1, 2, 3, 4, 5, 6, 7], [35, 70, 40, 80, 25, 70, 35]),
  addFlSpots([1, 2, 3, 4, 5, 6, 7], [80, 50, 90, 40, 80, 35, 60])
];

SideTitles get rightTitles => const SideTitles(
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
      style: Styles.kFontSize12.copyWith(color: TColor.gray),
      textAlign: TextAlign.center);
}

SideTitles get bottomTitles => const SideTitles(
  showTitles: true,
  reservedSize: 32,
  interval: 1,
  getTitlesWidget: bottomTitleWidgets,
);

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  var style = Styles.kFontSize12.copyWith(color: TColor.gray);
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
