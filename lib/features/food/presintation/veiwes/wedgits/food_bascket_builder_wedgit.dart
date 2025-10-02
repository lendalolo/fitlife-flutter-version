import 'package:fitness/features/food/data/models/all_meals.dart';
import 'package:fitness/features/food/presintation/views%20bloc/food%20bascket/food_pascket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common_widget/meal_food_schedule_row.dart';
import '../../../data/models/meal_detailes.dart';
import '../../views bloc/bascket add/bascket_add_bloc.dart';

class FoodBascketBuliderWedgit extends StatelessWidget {
  const FoodBascketBuliderWedgit({
    super.key,
    required this.breakfastArr, required this.breakfastArrnotSended,
  });

  final List<Meal> breakfastArr;
  final List<MealDetailes> breakfastArrnotSended;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: breakfastArr.length + breakfastArrnotSended.length,
        itemBuilder: (context, index) {
          if (index < breakfastArr.length) {
            return MealFoodScheduleRow(
              mObj: breakfastArr[index],
              index: index,
              isSended: true,
            );
          }
          final notSendedIndex = index - breakfastArr.length;
          return MealFoodScheduleRow(
            index: notSendedIndex,
            unSendedmeal: breakfastArrnotSended[notSendedIndex],
            isSended: false,
          );
        });
  }
}