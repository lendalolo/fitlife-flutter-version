import 'package:fitness/features/food/data/models/all_meals.dart';
import 'package:fitness/features/food/presintation/views%20bloc/food%20bascket/food_pascket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../../../common_widget/custtom_bar_graph.dart';
import '../../../../../common_widget/no_internet_no_cache_Widget.dart';
import '../../../../home/presintation/views/widgets/today_target_widget.dart';
import '../../../../home/presintation/views_blocs/Exersices data/exercies_data_bloc.dart';
import '../../views bloc/bascket add/bascket_add_bloc.dart';
import '../../views bloc/meal bloc/meal_bloc.dart';
import '../loading pagess/new_recipes_wedgit_shimmer_loading.dart';
import '../meal_schedule_view.dart';
import 'custtom_drop_menu.dart';
import 'food_deffirent_peroid_time_list.dart';
import 'new_recipes_wedgit.dart';

class MealPlannerSuccessWedgit extends StatelessWidget {
  const MealPlannerSuccessWedgit({
    super.key,
    required this.textController,
    required this.media,
    required this.findEatArr,
    required this.allMyMeals,
  });
  final AllMyMeals allMyMeals;
  final TextEditingController textController;
  final Size media;
  final List findEatArr;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalazations.of(context)!
                          .translate("Meals Planer")["Meal Nutritions"],
                      style: Styles.kFontSize16,
                    ),
                    // CusttomDropMenu(
                    //   items: ["Weekly", "Monthly"],
                    //   onChanged: (String? value) {
                    //     BlocProvider.of<ExerciesDataBloc>(context)
                    //         .add(ExerciesDataEvent(value!));
                    //     textController.text = value;
                    //   },
                    // )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                CusttomBarGraph(
                  x: allMyMeals.data![0].x,
                  y: allMyMeals.data![0].y, lengthOfTheBar: allMyMeals.data![0].lenghtOfY.toDouble(),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                TodayTargetWidget(
                  text: AppLocalazations.of(context)!
                      .translate("Meals Planer")["Daily Meal Schedule"],
                  ontap: () async {
                   await GoRouter.of(context).pushNamed(Names.MealScheduleView,extra:[allMyMeals.data![0].pascketList,allMyMeals.id]);
                   BlocProvider.of<MealBloc>(context)..add(GetAllMealesEvent(1, 0, 0, 0));
                  },
                )
                // SizedBox(
                //   height: media.width * 0.05,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Today Meals",
                //       style: TextStyle(
                //           color: TColor.black,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w700),
                //     ),
                //     // CusttomFoodDropMenu(items: [
                //     //   "Breakfast",
                //     //   "Lunch",
                //     //   "Dinner",
                //     //   "Snack",
                //     //   "Dessert"
                //     // ], onChanged: (String?value ) {
                //     //   BlocProvider.of<FoodDataBloc>(context).add(FoodDataEvent(value!));
                //     //   textController.text = value;
                //     // },),
                //   ],
                // ),
                ,
                SizedBox(
                  height: media.width * 0.05,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppLocalazations.of(context)!
                    .translate("Meals Planer")["Choose the food"],
                style: Styles.kFontSize16,
              )),
          FoodDeffirentPeroidTimeList(
            media: media,
            findEatArr: findEatArr,
            lenght: allMyMeals.data![0].meal!.length,
          ),
          SizedBox(
            height: media.width * 0.05,
          ),
          CusttomAppTitle(
              title: AppLocalazations.of(context)!
                  .translate("Meals Planer")["All Food"]),
          // AppLocalazations.of(context)!
          //     .translate("Meals Planer")['new recipes']),

    NewRecipesWedgit(
    popularArr:
    //allMyMeals.data![0].pascketList
    allMyMeals.data![0].allMeals![0].meal!
    )
        ],
      ),
    );
  }
}
