import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/Loading_page.dart';
import 'package:fitness/common_widget/no_internet_no_cache_Widget.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/custtom_drop_menu.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/food_deffirent_peroid_time_list.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/plan_planner_success_wedgit.dart';
import 'package:fitness/features/home/presintation/views/widgets/today_target_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common_widget/custtom_bar_graph.dart';
import '../../../home/presintation/views_blocs/Exersices data/exercies_data_bloc.dart';
import '../views bloc/food bascket/food_pascket_bloc.dart';
import '../views bloc/meal bloc/meal_bloc.dart';
import 'loading pagess/meal_planner_scadual_shimmer_wedgit.dart';
import 'meal_schedule_view.dart';

class MealPlannerView extends StatefulWidget {
  const MealPlannerView({super.key});

  @override
  State<MealPlannerView> createState() => _MealPlannerViewState();
}

class _MealPlannerViewState extends State<MealPlannerView> {
  List todayMealArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/m_1.png",
      "time": "28/05/2023 07:00 AM"
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/m_2.png",
      "time": "28/05/2023 08:00 AM"
    },
  ];

  // final List findEatArr = [
  //   {
  //     "name": "Breakfast",
  //     "image": "assets/img/m_3.png",
  //     "number": "120+ Foods"
  //   },
  //   {"name": "Lunch", "image": "assets/img/m_4.png", "number": "130+ Foods"},
  //   {"name": "Dinner", "image": "assets/img/m_2.png", "number": "130+ Foods"},
  //   {"name": "snacks", "image": "assets/img/m_1.png", "number": "120+ Foods"},
  // ];
  int touchedIndex = -1;
  TextEditingController graphController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List findEatArr = [
      {
        "name": "${AppLocalazations.of(context)!
            .translate("Meals Planer")["BreakFast"]}",
        "image": "assets/img/m_3.png",
        "number": ""
      },
      {"name": "${AppLocalazations.of(context)!
          .translate("Meals Planer")["Lunch"]}", "image": "assets/img/m_4.png", "number": ""},
      {"name": "${AppLocalazations.of(context)!
          .translate("Meals Planer")["Dinner"]}", "image": "assets/img/m_2.png", "number": ""},
      {"name": "${AppLocalazations.of(context)!
          .translate("Meals Planer")["Snacks"]}", "image": "assets/img/m_1.png", "number": ""},
    ];
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CusttomAppBarForAppBarProberty(
          context: context,
          title: AppLocalazations.of(context)!
              .translate("Meals Planer")["Meal Planner"]),
      body: BlocConsumer<MealBloc, MealState>(
        listener: (context, state) {
          if (state is GetAllMealsFailed) {
            showErrorDialogMesseage(
              context1: context,
              state: state.errorMessage,
              ontaptry: () {
                BlocProvider<MealBloc>.value(
                  value: BlocProvider.of<MealBloc>(context)
                    ..add(GetAllMealesEvent(1, 0, 0, 0)),
                );
                GoRouter.of(context).pop();
                // print('object');
              },
              ontapcancel: () {
                GoRouter.of(context).pop();
              },
            );
          }
        },
        builder: (context, state) {
          if (state is GetAllMealsSuccess) {
            return MealPlannerSuccessWedgit(
              textController: textController,
              media: media,
              findEatArr: findEatArr,
              allMyMeals: state.allMyMeals,
            );
          } else if (state is GetAllMealsFailed) {
            if (state.obj != Null) {
              return MealPlannerSuccessWedgit(
                textController: textController,
                media: media,
                findEatArr: findEatArr,
                allMyMeals: state.obj,
              );
            } else {
              return Center(child: NoInternetNoCachWedgit(
                ontap: () {
                  BlocProvider<MealBloc>.value(
                    value: BlocProvider.of<MealBloc>(context)
                      ..add(GetAllMealesEvent(1, 0, 0, 0)),
                  );
                },
              ));
            }
          }
          return MealPlannerScadualShimmerWedgit();
        },

      ),
    );
  }
}
