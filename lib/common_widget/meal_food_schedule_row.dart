import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/styles.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../common/api_servieses.dart';
import '../features/food/data/models/all_meals.dart';
import '../features/food/data/models/meal_detailes.dart';
import '../features/food/presintation/views bloc/bascket add/bascket_add_bloc.dart';
import '../features/food/presintation/views bloc/food bascket/food_pascket_bloc.dart';
import 'custtom_app_image_with_gradient_backgroung.dart';

class MealFoodScheduleRow extends StatelessWidget {
  final Meal? mObj;
  final MealDetailes? unSendedmeal;
  final bool isSended;
  final int index;
  const MealFoodScheduleRow({super.key,this.mObj, required this.index, this.unSendedmeal, required this.isSended});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: isSended?TColor.white:TColor.primaryColor2.withOpacity(0.3),),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        child: Row(
          children: [
            CusttomAppImageWithGradentBackground(index: index, image:isSended?'$imageBaseUrl${mObj!.media![0].originalUrl!.split('8000/').last}':  '$imageBaseUrl${unSendedmeal!.data!.media![0].originalUrl!.split('8000/').last}'),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSended? mObj!.title.toString():unSendedmeal!.data!.title.toString(),
                    style: Styles.kFontSize12.copyWith(color: TColor.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    isSended?  mObj!.calories.toString(): unSendedmeal!.data!.calories.toString(),
                    style: Styles.kFontSize10,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
              isSended ? BlocProvider.of<FoodPascketBloc>(context).add(DeleateFoodFromPascketEvent(mObj!.pivot!.mealId!)):
              BlocProvider.of<BascketAddBloc>(context).add(RemoveItemFromBascketEvent(unSendedmeal!.data!.id! ));
              },
              icon: Image.asset(
                "assets/img/closed_btn.png",
                width: 25,
                height: 25,
              ),
            )
          ],
        ));
  }
}


