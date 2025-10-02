import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../data/models/all_meals.dart';
import 'popular_meal_row.dart';
class NewRecipesWedgit extends StatelessWidget {
  const NewRecipesWedgit({
    super.key,
    required this.popularArr,
  });

  final List<Meal> popularArr;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: popularArr.length,
        itemBuilder: (context, index) {
          return PopularMealRow(
            mObj: popularArr[index], isFromTodatTarget: false,
          );
        });
  }
}