import 'package:fitness/features/home/presintation/views/widgets/showing_section.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/round_button.dart';
import '../../../data/models/profile_model.dart';

Container BMICalculate(ProfileModel profileModel,BuildContext context) {
  return Container(
    height: 160,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: TColor.primaryG),
        borderRadius: BorderRadius.circular(30)),
    child: Stack(alignment: Alignment.center, children: [
      Image.asset(
        "assets/img/bg_dots.png",
        height: 160,
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalazations.of(context)!.translate("Profile")["BMI (Body Mass Index)"],
                  style: Styles.kFontSize14.copyWith(
                      color: TColor.white, fontWeight: FontWeight.w700),
                ),
                Text(
                  "${AppLocalazations.of(context)!.translate("Profile")["You have a"]} ${profileModel.bmi}",
                  style: Styles.kFontSize12
                      .copyWith(color: TColor.white.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 20,
                ),
                // RoundButton(
                //     height: 35,
                //     title: "View More",
                //     fontStyle: Styles.kFontSize14,
                //     minWidth: 120,
                //     onPressed: () {})
              ],
            ),
            AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                  ),
                  startDegreeOffset: 250,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections: showingSections(value: profileModel.width!/profileModel.height!*profileModel.height!),
                ),
              ),
            ),
          ],
        ),
      )
    ]),
  );
}