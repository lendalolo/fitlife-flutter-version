import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/carbohidrateBasketBuilderWedgit.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/food_bascket_builder_wedgit.dart';
import 'package:fitness/features/food/presintation/views%20bloc/bascket%20add/bascket_add_bloc.dart';
import 'package:fitness/features/food/presintation/views%20bloc/meal%20bloc/meal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common_widget/bottom_snackbar_message.dart';
import '../../../../common_widget/custtom_app_title.dart';
import '../../../../common_widget/custtom_app_title_with_right_test.dart';
import '../../data/models/all_meals.dart';
import '../../data/models/meal_detailes.dart';
import '../views bloc/food bascket/food_pascket_bloc.dart';

class MealScheduleView extends StatefulWidget {
 // final List<Meal> state;
  final int planId;
  //final List<Meal> state;
  const MealScheduleView({super.key, required this.planId});

  @override
  State<MealScheduleView> createState() => _MealScheduleViewState();
}

class _MealScheduleViewState extends State<MealScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    // BlocProvider.of<FoodPascketBloc>(context).add(ReturnFoodPascketEvent(widget.state));
    BlocProvider.of<MealBloc>(context).add(GetAllMealesEvent(1, 0, 0, 0));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CusttomAppBarForAppBarProberty(
          context: context, title: AppLocalazations.of(context)!.translate("Meals Planer")["Meal  Schedule"]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: BlocConsumer<MealBloc, MealState>(
  listener: (context, mealstate) {
    if(mealstate is GetAllMealsSuccess)
   BlocProvider.of<FoodPascketBloc>(context).add(ReturnFoodPascketEvent(mealstate.allMyMeals.data![0].pascketList));
  },
  builder: (context, state) {
    return BlocConsumer<BascketAddBloc, BascketAddInitial>(
  listener: (context, bascketstate) {
  },
  builder: (context, bascketstate) {
    return BlocConsumer<FoodPascketBloc, FoodPascketGetit>(
              listener: (context, state) {

                            },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.breakfastArr.isNotEmpty||bascketstate.breakfastArrNotSended.isNotEmpty?
                    CusttomAppTitleWithrightTest(
                      RightWord: "${AppLocalazations.of(context)!.translate("Meals Planer")["Items"]}  ${state.breakfastArr.length+bascketstate.breakfastArrNotSended.length} | ${state.caloriesCountBeackfast+bascketstate.caloriesCountBeackfast} ${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}| ${state.caeboCountBeackfast+bascketstate.caeboCountBeackfast} ${AppLocalazations.of(context)!.translate("Meals Planer")["carbo"]}| ${state.fatesCountBeackfast+bascketstate.fatesCountBeackfast } ${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]}| ${state.protiensCountBeackfast+bascketstate.protiensCountBeackfast } ${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]}",
                      title: "${AppLocalazations.of(context)!.translate("Meals Planer")["BreakFast"]}",
                    ):SizedBox(),
                    FoodBascketBuliderWedgit(breakfastArr: state.breakfastArr, breakfastArrnotSended:bascketstate.breakfastArrNotSended,),
                    state.lunchArr.isNotEmpty||bascketstate.lunchArrNotSended.isNotEmpty? CusttomAppTitleWithrightTest(
                      RightWord: " ${AppLocalazations.of(context)!.translate("Meals Planer")["Items"]} ${state.lunchArr.length+bascketstate.lunchArrNotSended.length} | ${state.caloriesCountLnche+bascketstate.caloriesCountLnche} ${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}| ${state.caeboCountLnche+bascketstate.caeboCountLnche} ${AppLocalazations.of(context)!.translate("Meals Planer")["carbo"]}| ${state.fatesCountLnche+bascketstate.fatesCountLnche } ${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]}| ${state.protiensCountLnche+bascketstate.protiensCountLnche } ${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]}",
                      title: '${AppLocalazations.of(context)!.translate("Meals Planer")["Lunch"]}',
                    ):SizedBox(),
                    FoodBascketBuliderWedgit(breakfastArr: state.lunchArr, breakfastArrnotSended: bascketstate.lunchArrNotSended,),
                    state.snacksArr.isNotEmpty||bascketstate.snacksArrNotSended.isNotEmpty? CusttomAppTitleWithrightTest(
                        title: '${AppLocalazations.of(context)!.translate("Meals Planer")["Snacks"]}',
                        RightWord: " ${AppLocalazations.of(context)!.translate("Meals Planer")["Items"]} ${state.snacksArr.length+bascketstate.snacksArrNotSended.length} | ${state.caloriesCountSnack+bascketstate.caloriesCountSnack} ${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}| ${state.caeboCountSnack+bascketstate.caeboCountSnack} ${AppLocalazations.of(context)!.translate("Meals Planer")["carbo"]}| ${state.fatesCountSnack+bascketstate.fatesCountSnack } ${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]}| ${state.protiensCountSnack+bascketstate.protiensCountSnack } ${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]}")
                    :SizedBox(),
                    FoodBascketBuliderWedgit(breakfastArr:state.snacksArr, breakfastArrnotSended:bascketstate.snacksArrNotSended,),
    state.dinnerArr.isNotEmpty||bascketstate.dinnerArrNotSended.isNotEmpty?CusttomAppTitleWithrightTest(
                        title: '${AppLocalazations.of(context)!.translate("Meals Planer")["Dinner"]}',
                        RightWord: "${AppLocalazations.of(context)!.translate("Meals Planer")["Items"]} ${state.dinnerArr.length+bascketstate.dinnerArrNotSended.length} | ${state.caloriesCountDinner+bascketstate.caloriesCountDinner } ${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}| ${state.caeboCountDinner+bascketstate.caeboCountDinner  } ${AppLocalazations.of(context)!.translate("Meals Planer")["carbo"]}| ${state.fatesCountDinner+bascketstate.fatesCountDinner  } ${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]}| ${state.protiensCountDinner+bascketstate.protiensCountDinner  } ${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]}")
                    :SizedBox(),
                    FoodBascketBuliderWedgit(breakfastArr: state.dinnerArr, breakfastArrnotSended: bascketstate.dinnerArrNotSended,),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    CusttomAppTitle(title: "${AppLocalazations.of(context)!.translate("Meals Planer")["Today Meal Nutritions"]}"),
                    CarbohidrateBascketBuilderWedgit(
                        nutritionArr: [state.caloriesCount+bascketstate.caloriesCount,state.protiensCount+bascketstate.protiensCount,state.fatesCount+bascketstate.fatesCount,state.caeboCount+bascketstate.caeboCount]),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BlocConsumer<MealBloc, MealState>(
  listener: (context, mealstate) {
    if(mealstate is StoreMealsSuccess)
   {
     BlocProvider.of<BascketAddBloc>(context).add(EmptyBascketEvent());
     BlocProvider.of<MealBloc>(context).add(GetAllMealesEvent(1, 0, 0, 0));
     bottomSnackbarMassage(message:mealstate.storeMeal.message! ,context: context);
   }
  },
  builder: (context, mealstate) {
    if(mealstate is StoreMealsSuccess) {
      return CusttomAppButton(title: AppLocalazations.of(context)!.translate("Meals Planer")["Success"], onPressed: () {},);
    }
    else if(mealstate is StoreMealsFailed){
      return CusttomAppButton(title:AppLocalazations.of(context)!.translate("Meals Planer")["the Operation is Failed Try Again"] , onPressed: () {
        BlocProvider.of<MealBloc>(context).add(StoreMealEvent(state.caloriesList+bascketstate.caloriesList, state.checkList+bascketstate.checkList, widget.planId));
      },);
    }
    else if(mealstate is StoreMealsLoading){
      return CusttomAppButton(title: AppLocalazations.of(context)!.translate("Meals Planer")["Loading..."], onPressed: () {},);
    }
    return CusttomAppButton(title: AppLocalazations.of(context)!.translate("Meals Planer")["Submit My Choices"], onPressed: () {
      final Map<int, int> uniqueMeals = {};
      for (int i = 0; i < state.checkList.length; i++) {
        uniqueMeals[state.checkList[i]] = state.caloriesList[i];
      }
      for (int i = 0; i < bascketstate.checkList.length; i++) {
        final id = bascketstate.checkList[i];
        final calorie = bascketstate.caloriesList[i];

        if (!uniqueMeals.containsKey(id)) {
          uniqueMeals[id] = calorie;
        }
      }

      final finalCheckList = uniqueMeals.keys.toList();
      final finalCaloriesList = uniqueMeals.values.toList();
      BlocProvider.of<MealBloc>(context).add(
        StoreMealEvent(finalCaloriesList, finalCheckList, widget.planId),
      );
   //   BlocProvider.of<MealBloc>(context).add(StoreMealEvent(state.caloriesList+bascketstate.caloriesList, state.checkList+bascketstate.checkList, widget.planId));
    },);
  },

),
                    )
                  ],
                );
              },
            );
  },
);
  },
),
          ))
        ],
      ),
    );
  }
}
