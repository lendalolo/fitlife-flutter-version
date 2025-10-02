part of 'meal_bloc.dart';

class MealState {}
class MealInitial extends MealState {}
class GetAllMealsSuccess extends MealState {
 final AllMyMeals allMyMeals;
 GetAllMealsSuccess(this.allMyMeals);
}
class GetAllMealsFailed extends MealState {
 final String errorMessage;
 final dynamic obj;
 GetAllMealsFailed(this.errorMessage, this.obj);
}
class GetAllMealsLoading extends MealState {
}
class GetMealDetailesSuccess extends MealState {
 final MealDetailes mealDetailes;
 GetMealDetailesSuccess(this.mealDetailes);
}
class GeMealDetailesFailed extends MealState {
 final String errorMessage;
 final dynamic obj;
 GeMealDetailesFailed(this.errorMessage, this.obj);
}
class GetMealDetailesLoading extends MealState {
}
class StoreMealsSuccess extends MealState {
 final StoreMeal storeMeal;
 StoreMealsSuccess(this.storeMeal);
}
class StoreMealsFailed extends MealState {
 final String errorMessage;
 StoreMealsFailed(this.errorMessage);
}
class StoreMealsLoading extends MealState {
}