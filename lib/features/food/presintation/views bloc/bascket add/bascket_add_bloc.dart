import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/meal_detailes.dart';

part 'bascket_add_event.dart';
part 'bascket_add_state.dart';

class BascketAddBloc extends Bloc<BascketAddEvent, BascketAddInitial> {
  BascketAddBloc() : super(BascketAddInitial()) {
    on<BascketAddItemEvent>((event, emit) {
      final updatedList = List<MealDetailes>.from(state.items);
      if (!updatedList.any((item) => item.data!.id! == event.subList.data!.id)) {
        updatedList.add(event.subList);
      }
     // final updatedList = List<MealDetailes>.from(state.items)..add(event.subList);

      // Local temporary state
      List<MealDetailes> breakfastArrNotAded = [];
      List<MealDetailes> lunchArrNotAded = [];
      List<MealDetailes> snacksArrNotAded = [];
      List<MealDetailes> dinnerArrNotAded = [];

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
        final data = element.data!;
        // final time = data.time!.first;
        // Add to caloriesList and checkList
        caloriesList.add(data.calories! );
        checkList.add(element.data!.id! );

        if (element.data!.breakfast == 1) {
          breakfastArrNotAded.add(element);
          caloriesCountBeackfast += data.calories!;
          caeboCountBeackfast += data.carbohydrates!;
          protiensCountBeackfast += data.proteins!;
          fatesCountBeackfast += data.fats!;
        } else if (element.data!.dinner == 1) {
          dinnerArrNotAded.add(element);
          caloriesCountDinner += data.calories!;
          caeboCountDinner += data.carbohydrates!;
          protiensCountDinner += data.proteins!;
          fatesCountDinner += data.fats!;
        } else if (element.data!.lunch == 1) {
          lunchArrNotAded.add(element);
          caloriesCountLnche += data.calories!;
          caeboCountLnche += data.carbohydrates!;
          protiensCountLnche += data.proteins!;
          fatesCountLnche += data.fats!;
        } else if (element.data!.snacks == 1) {
          snacksArrNotAded.add(element);
          caloriesCountSnack += data.calories!;
          caeboCountSnack += data.carbohydrates!;
          protiensCountSnack += data.proteins!;
          fatesCountSnack += data.fats!;
        }

        // Total across all meals
        caloriesCount += data.calories!;
        caeboCount += data.carbohydrates!;
        fatesCount += data.fats!;
        protiensCount += data.proteins!;
      }

      emit(state.copyWith(
        items: updatedList,
        breakfastArrNotSended: breakfastArrNotAded,
        lunchArrNotSended: lunchArrNotAded,
        snacksArrNotSended: snacksArrNotAded,
        dinnerArrNotSended: dinnerArrNotAded,
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
        checkList: checkList,
        caloriesList: caloriesList
      ));
    });

    // on<RemoveItemFromBascketEvent>((event, emit) {
    //   final indexToRemove = state.items.indexWhere(
    //         (item) => item.data?.id == event.itemToRemove,
    //   );
    //
    //   if (indexToRemove == -1) {
    //     print('Item not found in list: ${event.itemToRemove}');
    //     return;
    //   }
    //
    //   final targetItem = state.items[indexToRemove];
    //
    //   final updatedItems = List<MealDetailes>.from(state.items)
    //     ..removeAt(indexToRemove);
    //
    //   final updatedCheckList = List<int>.from(state.checkList)
    //     ..remove(targetItem.data!.id);
    //
    //   final updatedCaloriesList = List<int>.from(state.caloriesList)
    //     ..remove(targetItem.data!.calories);
    //   //
    //   // final targetItem = state.items.firstWhere(
    //   //       (item) => item.data?.id == event.itemToRemove,
    //   //   orElse: () => MealDetailes(), // fallback empty if not found
    //   // );
    //   //
    //   // if (targetItem.data == null) return; // exit early if not found
    //   //
    //   // final updatedItems = state.items.where((item) => item.data?.id != event.itemToRemove).toList();
    //
    //   // Copy current state lists
    //   final breakfastList = List<MealDetailes>.from(state.breakfastArrNotSended);
    //   final lunchList = List<MealDetailes>.from(state.lunchArrNotSended);
    //   final dinnerList = List<MealDetailes>.from(state.dinnerArrNotSended);
    //   final snacksList = List<MealDetailes>.from(state.snacksArrNotSended);
    //
    //   final caloriesList = List<int>.from(state.caloriesList)..remove(targetItem.data!.calories);
    //   final checkList = List<int>.from(state.checkList)..remove(targetItem.data!.id);
    //
    //   int caloriesCount = state.caloriesCount - targetItem.data!.calories!;
    //   int protiensCount = state.protiensCount - targetItem.data!.proteins!;
    //   int fatesCount = state.fatesCount - targetItem.data!.fats!;
    //   int caeboCount = state.caeboCount - targetItem.data!.carbohydrates!;
    //
    //   // Handle time-specific list and value update
    //   final time = targetItem.data!.time!.first;
    //
    //   int caloriesCountBeackfast = state.caloriesCountBeackfast;
    //   int protiensCountBeackfast = state.protiensCountBeackfast;
    //   int fatesCountBeackfast = state.fatesCountBeackfast;
    //   int caeboCountBeackfast = state.caeboCountBeackfast;
    //
    //   int caloriesCountLnche = state.caloriesCountLnche;
    //   int protiensCountLnche = state.protiensCountLnche;
    //   int fatesCountLnche = state.fatesCountLnche;
    //   int caeboCountLnche = state.caeboCountLnche;
    //
    //   int caloriesCountDinner = state.caloriesCountDinner;
    //   int protiensCountDinner = state.protiensCountDinner;
    //   int fatesCountDinner = state.fatesCountDinner;
    //   int caeboCountDinner = state.caeboCountDinner;
    //
    //   int caloriesCountSnack = state.caloriesCountSnack;
    //   int protiensCountSnack = state.protiensCountSnack;
    //   int fatesCountSnack = state.fatesCountSnack;
    //   int caeboCountSnack = state.caeboCountSnack;
    //
    //   if (time.breakfast == 1) {
    //     breakfastList.removeWhere((e) => e.data?.id == event.itemToRemove);
    //     caloriesCountBeackfast -= targetItem.data!.calories!;
    //     protiensCountBeackfast -= targetItem.data!.proteins!;
    //     fatesCountBeackfast -= targetItem.data!.fats!;
    //     caeboCountBeackfast -= targetItem.data!.carbohydrates!;
    //   } else if (time.lunch == 1) {
    //     lunchList.removeWhere((e) => e.data?.id == event.itemToRemove);
    //     caloriesCountLnche -= targetItem.data!.calories!;
    //     protiensCountLnche -= targetItem.data!.proteins!;
    //     fatesCountLnche -= targetItem.data!.fats!;
    //     caeboCountLnche -= targetItem.data!.carbohydrates!;
    //   } else if (time.dinner == 1) {
    //     dinnerList.removeWhere((e) => e.data?.id == event.itemToRemove);
    //     caloriesCountDinner -= targetItem.data!.calories!;
    //     protiensCountDinner -= targetItem.data!.proteins!;
    //     fatesCountDinner -= targetItem.data!.fats!;
    //     caeboCountDinner -= targetItem.data!.carbohydrates!;
    //   } else if (time.snacks == 1) {
    //     snacksList.removeWhere((e) => e.data?.id == event.itemToRemove);
    //     caloriesCountSnack -= targetItem.data!.calories!;
    //     protiensCountSnack -= targetItem.data!.proteins!;
    //     fatesCountSnack -= targetItem.data!.fats!;
    //     caeboCountSnack -= targetItem.data!.carbohydrates!;
    //   }
    //
    //   emit(state.copyWith(
    //     items: updatedItems,
    //     checkList: checkList,
    //     caloriesList: caloriesList,
    //     breakfastArrNotSended: breakfastList,
    //     lunchArrNotSended: lunchList,
    //     dinnerArrNotSended: dinnerList,
    //     snacksArrNotSended: snacksList,
    //     caloriesCount: caloriesCount,
    //     protiensCount: protiensCount,
    //     fatesCount: fatesCount,
    //     caeboCount: caeboCount,
    //     caloriesCountBeackfast: caloriesCountBeackfast,
    //     protiensCountBeackfast: protiensCountBeackfast,
    //     fatesCountBeackfast: fatesCountBeackfast,
    //     caeboCountBeackfast: caeboCountBeackfast,
    //     caloriesCountLnche: caloriesCountLnche,
    //     protiensCountLnche: protiensCountLnche,
    //     fatesCountLnche: fatesCountLnche,
    //     caeboCountLnche: caeboCountLnche,
    //     caloriesCountDinner: caloriesCountDinner,
    //     protiensCountDinner: protiensCountDinner,
    //     fatesCountDinner: fatesCountDinner,
    //     caeboCountDinner: caeboCountDinner,
    //     caloriesCountSnack: caloriesCountSnack,
    //     protiensCountSnack: protiensCountSnack,
    //     fatesCountSnack: fatesCountSnack,
    //     caeboCountSnack: caeboCountSnack,
    //   ));
    // });
    on<RemoveItemFromBascketEvent>((event, emit) {
      final indexToRemove = state.items.indexWhere(
            (item) => item.data?.id == event.itemToRemove,
      );

      if (indexToRemove == -1) {
        print('Item not found in list: ${event.itemToRemove}');
        return;
      }

      final targetItem = state.items[indexToRemove];

      final updatedItems = List<MealDetailes>.from(state.items)
        ..removeAt(indexToRemove);

      final updatedCheckList = List<int>.from(state.checkList)..remove(targetItem.data!.id);

      final updatedCaloriesList = List<int>.from(state.caloriesList)..remove(targetItem.data!.calories);

      //final time = targetItem.data!.time!.first;
      final cal = targetItem.data!.calories!;
      final pro = targetItem.data!.proteins!;
      final fat = targetItem.data!.fats!;
      final carb = targetItem.data!.carbohydrates!;

      // Clone arrays
      final breakfastList = List<MealDetailes>.from(state.breakfastArrNotSended);
      final lunchList = List<MealDetailes>.from(state.lunchArrNotSended);
      final dinnerList = List<MealDetailes>.from(state.dinnerArrNotSended);
      final snacksList = List<MealDetailes>.from(state.snacksArrNotSended);

      // Initialize per-meal nutrition counters
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

      if (targetItem.data!.breakfast == 1) {
        final index = breakfastList.indexWhere((e) => e.data?.id == event.itemToRemove);
        if (index != -1){ breakfastList.removeAt(index);

        caloriesCountBeackfast -= cal;
        protiensCountBeackfast -= pro;
        fatesCountBeackfast -= fat;
        caeboCountBeackfast -= carb;}
      } else if (targetItem.data!.dinner == 1) {
        final index = dinnerList.indexWhere((e) => e.data?.id == event.itemToRemove);
        if (index != -1)
         {
           dinnerList.removeAt(index);
           caloriesCountLnche -= cal;
           protiensCountLnche -= pro;
           fatesCountLnche -= fat;
           caeboCountLnche -= carb;
         }

      } else if (targetItem.data!.lunch  == 1) {
        final index = lunchList.indexWhere((e) => e.data?.id == event.itemToRemove);
        if (index != -1){ lunchList.removeAt(index);

        caloriesCountDinner -= cal;
        protiensCountDinner -= pro;
        fatesCountDinner -= fat;
        caeboCountDinner -= carb;}
      } else if (targetItem.data!.snacks == 1) {
        final index = snacksList.indexWhere((e) => e.data?.id == event.itemToRemove);
        if (index != -1){ snacksList.removeAt(index);

        caloriesCountSnack -= cal;
        protiensCountSnack -= pro;
        fatesCountSnack -= fat;
        caeboCountSnack -= carb;}
      }

      // Update total nutrition values
      final caloriesCount = state.caloriesCount - cal;
      final protiensCount = state.protiensCount - pro;
      final fatesCount = state.fatesCount - fat;
      final caeboCount = state.caeboCount - carb;

      emit(state.copyWith(
        items: updatedItems,
        checkList: updatedCheckList,
        caloriesList: updatedCaloriesList,
        breakfastArrNotSended: breakfastList,
        lunchArrNotSended: lunchList,
        dinnerArrNotSended: dinnerList,
        snacksArrNotSended: snacksList,
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

    on<EmptyBascketEvent>((event, emit) {
      emit(state.copyWith(
        items: [],
        checkList: [],
        caloriesList: [],
        breakfastArrNotSended: [],
        lunchArrNotSended: [],
        dinnerArrNotSended: [],
        snacksArrNotSended: [],
        caloriesCount: 0,
        protiensCount: 0,
        fatesCount: 0,
        caeboCount: 0,
        caloriesCountBeackfast: 0,
        protiensCountBeackfast: 0,
        fatesCountBeackfast: 0,
        caeboCountBeackfast: 0,
        caloriesCountLnche: 0,
        protiensCountLnche: 0,
        fatesCountLnche: 0,
        caeboCountLnche: 0,
        caloriesCountDinner: 0,
        protiensCountDinner: 0,
        fatesCountDinner: 0,
        caeboCountDinner: 0,
        caloriesCountSnack: 0,
        protiensCountSnack: 0,
        fatesCountSnack: 0,
        caeboCountSnack: 0,
      ));
    });
    // on<RemoveItemFromBascketEvent>((event, emit) {
      //   final List<MealDetailes> updatedList = List.from(state.items);
      //   final indexToRemove = updatedList.indexWhere((meal) => meal.data!.id == event.itemToRemove);
      //   if (indexToRemove != -1) {
      //     updatedList.removeAt(indexToRemove);
      //     emit(state.copyWith(items: updatedList));
      //   }
      // });
  }
}
