import 'package:dartz/dartz.dart';
import '../../../../common/errors/failures.dart';
import '../models/all_meals.dart';
import '../models/meal_categories.dart';
import '../models/meal_detailes.dart';
import '../models/store_meals.dart';

abstract class MealRepo{
  Future<Either<Failure, AllMyMeals>> fetchAllMeal (int breakfast,int lunch,int dinner,int snack);
  Future<Either<Failure, StoreMeal> >storeMeal (List<int> calories, List<int> check,int plan_id);
  Future<Either<Failure, MealDetailes>> fetchMealDetailes (int Meal_id);
  Future<Either<Failure, MealCategories>> fetchMealCategories ();

}