import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/errors/exiptions.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../models/all_meals.dart';
import '../models/meal_categories.dart';
import '../models/meal_detailes.dart';

abstract class MealLocalData{

  Future<Unit> cacheAllMeales(AllMyMeals allMyMeals,int breakfast,int lunch,int dinner,int snack);
  Future<Unit> cacheAllMealesDetailes(MealDetailes mealDetailes,int Meal_id);
  Future<Unit> cacheMealesCategores(MealCategories mealCategories);

  AllMyMeals fetchLocalAllMeal(int breakfast,int lunch,int dinner,int snack);
  MealDetailes fetchLocalMealDetailes(int Meal_id);
  MealCategories fetchLocalMealCategories();
}

class MealLocalDataImpl extends MealLocalData{
  @override
  Future<Unit> cacheAllMeales(AllMyMeals allMyMeals, int breakfast, int lunch, int dinner, int snack) {
      getIt.get<SharedPreferences>().setString('$AllMealsName$breakfast$lunch$dinner$snack', json.encode(allMyMeals));
      return Future.value(unit);
  }

  @override
  Future<Unit> cacheAllMealesDetailes(MealDetailes mealDetailes, int Meal_id) {
    getIt.get<SharedPreferences>().setString('$MealDetailesName$Meal_id', json.encode(mealDetailes));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheMealesCategores(MealCategories mealCategories) {
    getIt.get<SharedPreferences>().setString(MealCategoriesName, json.encode(mealCategories));
    return Future.value(unit);
  }

  @override
  AllMyMeals fetchLocalAllMeal(int breakfast, int lunch, int dinner, int snack) {
      final mealsList =getIt.get<SharedPreferences>().getString('$AllMealsName$breakfast$lunch$dinner$snack');
      if( mealsList!= null)
      {
        dynamic allMealdecode = json.decode(mealsList);
        AllMyMeals result = AllMyMeals.fromJson(allMealdecode);
        return result;
      }
      else{
        throw EmptyCacheException();
      }
  }

  @override
  MealCategories fetchLocalMealCategories() {
    final categoriesList =getIt.get<SharedPreferences>().getString('$MealCategoriesName');
    if( categoriesList!= null)
    {
      dynamic categoriesMealdecode = json.decode(categoriesList);
      MealCategories result = MealCategories.fromJson(categoriesMealdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

  @override
  MealDetailes fetchLocalMealDetailes(int Meal_id) {
    final mealDetailesList =getIt.get<SharedPreferences>().getString('$MealDetailesName$Meal_id');
    if( mealDetailesList!= null)
    {
      dynamic mealDetailesdecode = json.decode(mealDetailesList);
      MealDetailes result = MealDetailes.fromJson(mealDetailesdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }
}