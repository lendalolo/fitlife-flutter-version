import 'package:fitness/features/workout_tracker/presintation/weggits/exercies%20detailes%20wedgites/step_detail_row.dart';
import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../../../common_widget/food_step_detail_row.dart';
class RecipyStepsSetion extends StatelessWidget {
  final List stepArr;
  const RecipyStepsSetion({super.key, required this.stepArr});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CusttomAppTitle(title: "${AppLocalazations.of(context)!.translate("Meals Planer")["Step by Step"]}"),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 15),child:  Text(
            "${stepArr.length} ${AppLocalazations.of(context)!.translate("Meals Planer")["Steps"]}",
            style:
            TextStyle(color: TColor.gray, fontSize: 12),
          ),)
        ],),
      const SizedBox(
        height: 15,
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        itemCount: stepArr.length,
        itemBuilder: ((context, index) {
          return
            FoodStepDetailRow(
            sObj: stepArr[index],
            isLast: stepArr.last == stepArr[index], index: index,
          );
        }),
      )
    ],);
  }
}