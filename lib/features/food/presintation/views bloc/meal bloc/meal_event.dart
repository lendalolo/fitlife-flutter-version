part of 'meal_bloc.dart';
class MealEvent {}

class GetAllMealesEvent extends  MealEvent{

  final int breakfast;
  final int lunch;
  final int dinner;
  final int snack;
  GetAllMealesEvent( this.breakfast, this.lunch, this.dinner, this.snack);
}
class StoreMealEvent extends  MealEvent{
  final List<int> calories;
  final List<int> check;
  final int plan_id;
  StoreMealEvent(this.calories, this.check, this.plan_id);
}
class GetMealDetailesEvent extends  MealEvent{
  final int Meal_id;
  GetMealDetailesEvent(this.Meal_id);
}