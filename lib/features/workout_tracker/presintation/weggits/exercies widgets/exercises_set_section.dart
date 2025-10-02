
import 'package:fitness/common/styles.dart';
import 'package:fitness/features/workout_tracker/data/models/exercieses_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import 'exercises_card.dart';

class ExercisesSetSection extends StatelessWidget {
  final List<Exercise> sObj;
  final List<bool> checkList;
  final Function(Exercise obj) onPressed;
  const ExercisesSetSection ({super.key, required this.sObj, required this.onPressed, required this.checkList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text(
        //   '${AppLocalazations.of(context)!.translate('ExercisesPage')["Sets"]}',
        //   style: Styles.kFontSize12.copyWith(color: TColor.black,fontWeight: FontWeight.w500),
        // ),
        const SizedBox(
          height: 8,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,crossAxisSpacing: 12, mainAxisSpacing: 16,childAspectRatio: .7),
            padding: const EdgeInsets.all(12),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sObj.length,
            itemBuilder: (context, index) {
              return ExercisesRow(eObj: sObj[index], onPressed: (){
                  onPressed(sObj[index]);
              }, index: index, isFinished: checkList,);
            }),
      ],
    );
  }
}