import 'package:flutter/material.dart';

import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../data/models/all_meals.dart';
import 'meal_cell.dart';
class FoodListForParticularType extends StatelessWidget {
  const FoodListForParticularType({
    super.key,
    required this.media,
    required this.recommendArr, required this.state,
  });

  final Size media;
  final List recommendArr;
  final List<Meal> state;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CusttomAppTitle(title:  AppLocalazations.of(context)!
          .translate("Meals Planer")["Recommendation recipes"]),
      SizedBox(
        height: media.width * 0.6,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            scrollDirection: Axis.horizontal,
            itemCount: state.length,
            itemBuilder: (context, index) {
              return MealCell(
                state:state[index] ,
                fObj: {},
                index: index, isLoading: false,
              );
            }),
      ),
    ],);
  }
}