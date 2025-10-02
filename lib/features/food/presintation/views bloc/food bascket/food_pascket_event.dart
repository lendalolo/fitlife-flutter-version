part of 'food_pascket_bloc.dart';

class FoodPascketEvent {}

class DeleateFoodFromPascketEvent extends FoodPascketEvent {
  final int id;
  DeleateFoodFromPascketEvent(this.id);
}
class ReturnFoodPascketEvent  extends FoodPascketEvent{
  final List<Meal> subList;
  ReturnFoodPascketEvent(this.subList);
}

