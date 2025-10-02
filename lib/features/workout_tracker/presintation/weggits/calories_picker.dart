import 'package:fitness/common/styles.dart';
import 'package:fitness/features/workout_tracker/data/models/exercieses_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/colo_extension.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../data/models/exercies_detailes_models.dart';
class CaloriesBicker extends StatelessWidget {
  final Function(int calore) onPressed;
  final ExerciesDetailes obj;
  const CaloriesBicker({
    super.key, required this.obj, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CupertinoPicker.builder(
        itemExtent: 40,
        selectionOverlay: Container(
          width: double.maxFinite,
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: TColor.gray.withOpacity(0.2), width: 1),
              bottom: BorderSide(
                  color: TColor.gray.withOpacity(0.2), width: 1),
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          onPressed((index + 1) * 15);
        },
        childCount: obj.counter,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/burn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
              Text(
                " ${(index + 1) * 15}   ${AppLocalazations.of(context)!.translate("GoalsPage")["calories"]}",
                style: Styles.kFontSize10,
              ),
              Text(
                " ${index + 1} ",
                style: Styles.kFontSize24,
              ),
              Text(
                '${AppLocalazations.of(context)!.translate("ExercisesPage")[" times"]}',
                style: Styles.kFontSize16.copyWith(color: TColor.gray),
              )
            ],
          );
        },
      ),
    );
  }
}