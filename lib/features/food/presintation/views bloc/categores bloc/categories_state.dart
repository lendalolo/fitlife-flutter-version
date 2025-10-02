part of 'categories_bloc.dart';

 class CategoriesState {}

 class CategoriesInitial extends CategoriesState {}
class GetMealsCategoriesSuccess extends CategoriesState {
  final MealCategories mealCategories;
  GetMealsCategoriesSuccess(this.mealCategories);
}
class GeMealsCategoriesFailed extends CategoriesState {
  final String errorMessage;
  final dynamic obj;
  GeMealsCategoriesFailed(this.errorMessage, this.obj);
}
class GetMealsCategoriesLoading extends CategoriesState {
}
