import 'package:bloc/bloc.dart';
import 'package:fitness/features/food/data/models/all_meals.dart';
import 'package:meta/meta.dart';

import '../../../data/models/meal_detailes.dart';

part 'food_pascket_event.dart';
part 'food_pascket_state.dart';

class FoodPascketBloc extends Bloc<FoodPascketEvent, FoodPascketGetit> {
  FoodPascketBloc() : super(FoodPascketGetit([])) {
    // on<DeleateFoodFromPascketEvent>((event, emit) {
    //   final updatedList = List<Meal>.from(state.sortedList)
    //     ..removeWhere((meal) => meal.id == event.id);
    //   emit(state.copyWith(sortedList: updatedList));
    // });
    on<ReturnFoodPascketEvent>((event, emit) {
      final updatedList = List<Meal>.from(event.subList);
      print(updatedList.length);

      List<Meal> breakfastArr = [];
      List<Meal> lunchArr = [];
      List<Meal> snacksArr = [];
      List<Meal> dinnerArr = [];

      int caloriesCount = 0;
      int protiensCount = 0;
      int fatesCount = 0;
      int caeboCount = 0;

      int caloriesCountLnche = 0;
      int protiensCountLnche = 0;
      int fatesCountLnche = 0;
      int caeboCountLnche = 0;

      int caloriesCountDinner = 0;
      int protiensCountDinner = 0;
      int fatesCountDinner = 0;
      int caeboCountDinner = 0;

      int caloriesCountSnack = 0;
      int protiensCountSnack = 0;
      int fatesCountSnack = 0;
      int caeboCountSnack = 0;

      int caloriesCountBeackfast = 0;
      int protiensCountBeackfast = 0;
      int fatesCountBeackfast = 0;
      int caeboCountBeackfast = 0;
      List<int> checkList = [];
      List<int> caloriesList = [];

      for (var element in updatedList) {
        caloriesList.add(element.calories!);
        checkList.add(element.id!);
        // print(caloriesList.length);
        // print(checkList.length);
        if (element.pivot!.breakfast == 1) {
          breakfastArr.add(element);
          caloriesCountBeackfast += element.calories!;
          caeboCountBeackfast += element.carbohydrates!;
          protiensCountBeackfast += element.proteins!;
          fatesCountBeackfast += element.fats!;
        }
        else if (element.pivot!.dinner == 1) {
          dinnerArr.add(element);
          caloriesCountDinner += element.calories!;
          caeboCountDinner += element.carbohydrates!;
          protiensCountDinner += element.proteins!;
          fatesCountDinner += element.fats!;
        }
        else if (element.pivot!.lunch == 1) {
          lunchArr.add(element);
          caloriesCountLnche += element.calories!;
          caeboCountLnche += element.carbohydrates!;
          protiensCountLnche += element.proteins!;
          fatesCountLnche += element.fats!;
        }
        else if (element.pivot!.snacks == 1) {
          snacksArr.add(element);
          caloriesCountSnack += element.calories!;
          caeboCountSnack += element.carbohydrates!;
          protiensCountSnack += element.proteins!;
          fatesCountSnack += element.fats!;
        }

        // Total count (for all)
        caloriesCount += element.calories!;
        caeboCount += element.carbohydrates!;
        fatesCount += element.fats!;
        protiensCount += element.proteins!;
      }

      print('${event.subList} → food Basket (replaced)');

      emit(state.copyWith(
        sortedList: updatedList,
        breakfastArr: breakfastArr,
        lunchArr: lunchArr,
        snacksArr: snacksArr,
        dinnerArr: dinnerArr,
        caloriesCount: caloriesCount,
        protiensCount: protiensCount,
        fatesCount: fatesCount,
        caeboCount: caeboCount,
        caloriesCountLnche: caloriesCountLnche,
        protiensCountLnche: protiensCountLnche,
        fatesCountLnche: fatesCountLnche,
        caeboCountLnche: caeboCountLnche,
        caloriesCountDinner: caloriesCountDinner,
        protiensCountDinner: protiensCountDinner,
        fatesCountDinner: fatesCountDinner,
        caeboCountDinner: caeboCountDinner,
        caloriesCountSnack: caloriesCountSnack,
        protiensCountSnack: protiensCountSnack,
        fatesCountSnack: fatesCountSnack,
        caeboCountSnack: caeboCountSnack,
        caloriesCountBeackfast: caloriesCountBeackfast,
        protiensCountBeackfast: protiensCountBeackfast,
        fatesCountBeackfast: fatesCountBeackfast,
        caeboCountBeackfast: caeboCountBeackfast,
        caloriesList: caloriesList,
        checkList: checkList
      ));
    });
    on<DeleateFoodFromPascketEvent>((event, emit) {
      final indexToRemove = state.sortedList.indexWhere((item) => item.id == event.id);
     print("index to remove $indexToRemove");
      if (indexToRemove == -1) {
        print('Item not found in list: ${event.id}');
        return;
      }

      final itemToRemove = state.sortedList[indexToRemove];

      final updatedSortedList = List<Meal>.from(state.sortedList)
        ..removeWhere((item) => item.id == itemToRemove.id);
      print("updatedSortedList $updatedSortedList");
      final updatedCheckList = List<int>.from(state.checkList)
        ..remove(itemToRemove.id);
      print("iupdatedCheckList $updatedCheckList");
      final updatedCaloriesList = List<int>.from(state.caloriesList)
        ..remove(itemToRemove.calories);
      print("updatedCaloriesList $updatedCaloriesList");
      final pivot = itemToRemove.pivot!;
      int cal = itemToRemove.calories!;
      int pro = itemToRemove.proteins!;
      int fat = itemToRemove.fats!;
      int carb = itemToRemove.carbohydrates!;

      // Copy and update specific meal arrays
      List<Meal> breakfastArr = List<Meal>.from(state.breakfastArr);
      List<Meal> lunchArr = List<Meal>.from(state.lunchArr);
      List<Meal> snacksArr = List<Meal>.from(state.snacksArr);
      List<Meal> dinnerArr = List<Meal>.from(state.dinnerArr);

      int caloriesCountBeackfast = state.caloriesCountBeackfast;
      int protiensCountBeackfast = state.protiensCountBeackfast;
      int fatesCountBeackfast = state.fatesCountBeackfast;
      int caeboCountBeackfast = state.caeboCountBeackfast;

      int caloriesCountLnche = state.caloriesCountLnche;
      int protiensCountLnche = state.protiensCountLnche;
      int fatesCountLnche = state.fatesCountLnche;
      int caeboCountLnche = state.caeboCountLnche;

      int caloriesCountDinner = state.caloriesCountDinner;
      int protiensCountDinner = state.protiensCountDinner;
      int fatesCountDinner = state.fatesCountDinner;
      int caeboCountDinner = state.caeboCountDinner;

      int caloriesCountSnack = state.caloriesCountSnack;
      int protiensCountSnack = state.protiensCountSnack;
      int fatesCountSnack = state.fatesCountSnack;
      int caeboCountSnack = state.caeboCountSnack;

      if (pivot.breakfast == 1) {
        int index = breakfastArr.indexWhere((item) => item.id == itemToRemove.id);
        if (index != -1) {
          breakfastArr.removeAt(index);
          caloriesCountBeackfast -= cal;
          protiensCountBeackfast -= pro;
          fatesCountBeackfast -= fat;
          caeboCountBeackfast -= carb;
        }

      } else if ( pivot.dinner == 1) {
        int index = dinnerArr.indexWhere((item) => item.id == itemToRemove.id);
        if (index != -1) {
          dinnerArr.removeAt(index);
          caloriesCountDinner -= cal;
          protiensCountDinner -= pro;
          fatesCountDinner -= fat;
          caeboCountDinner -= carb;

        }

      } else if (pivot.lunch == 1) {
        int index = lunchArr.indexWhere((item) => item.id == itemToRemove.id);
        if (index != -1) {
          lunchArr.removeAt(index);
          caloriesCountLnche -= cal;
          protiensCountLnche -= pro;
          fatesCountLnche -= fat;
          caeboCountLnche -= carb;
        }

      } else if (pivot.snacks == 1) {
        int index = snacksArr.indexWhere((item) => item.id == itemToRemove.id);
        if (index != -1) {
          snacksArr.removeAt(index);
          caloriesCountSnack -= cal;
          protiensCountSnack -= pro;
          fatesCountSnack -= fat;
          caeboCountSnack -= carb;
        }
        //snacksArr.removeWhere((item) => item.id == itemToRemove.id);

      }

      // Update total nutrition counters
      int caloriesCount = state.caloriesCount - cal;
      int protiensCount = state.protiensCount - pro;
      int fatesCount = state.fatesCount - fat;
      int caeboCount = state.caeboCount - carb;

      emit(state.copyWith(
        sortedList: updatedSortedList,
        checkList: updatedCheckList,
        caloriesList: updatedCaloriesList,
        breakfastArr: breakfastArr,
        lunchArr: lunchArr,
        snacksArr: snacksArr,
        dinnerArr: dinnerArr,
        caloriesCount: caloriesCount,
        protiensCount: protiensCount,
        fatesCount: fatesCount,
        caeboCount: caeboCount,
        caloriesCountBeackfast: caloriesCountBeackfast,
        protiensCountBeackfast: protiensCountBeackfast,
        fatesCountBeackfast: fatesCountBeackfast,
        caeboCountBeackfast: caeboCountBeackfast,
        caloriesCountLnche: caloriesCountLnche,
        protiensCountLnche: protiensCountLnche,
        fatesCountLnche: fatesCountLnche,
        caeboCountLnche: caeboCountLnche,
        caloriesCountDinner: caloriesCountDinner,
        protiensCountDinner: protiensCountDinner,
        fatesCountDinner: fatesCountDinner,
        caeboCountDinner: caeboCountDinner,
        caloriesCountSnack: caloriesCountSnack,
        protiensCountSnack: protiensCountSnack,
        fatesCountSnack: fatesCountSnack,
        caeboCountSnack: caeboCountSnack,
      ));
    });
  }
  }
