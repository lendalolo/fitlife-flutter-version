import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
import '../../../data/models/meal_detailes.dart';
class CarbohidrateItem extends StatelessWidget {
  final Map nObj;
  final Map<String,int> list;
  const CarbohidrateItem({super.key, required this.nObj, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: TColor.primaryGWithOpacity,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              nObj["image"].toString(),
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${list.keys.toList().first.toString()} ${list.values.toList().first.toString()}',
                style: Styles.kFontSize12.copyWith(color: TColor.black),
              ),
            )
          ],
        ));
  }
}