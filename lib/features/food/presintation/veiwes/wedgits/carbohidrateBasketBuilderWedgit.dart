import 'package:flutter/material.dart';

import 'nutritions_row.dart';

class CarbohidrateBascketBuilderWedgit extends StatelessWidget {
  const CarbohidrateBascketBuilderWedgit({
    super.key,
    required this.nutritionArr,
  });

  final List nutritionArr;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: nutritionArr.length,
        itemBuilder: (context, index) {
          return NutritionRow(
            nObj: nutritionArr[index], index: index,
          );
        });
  }
}