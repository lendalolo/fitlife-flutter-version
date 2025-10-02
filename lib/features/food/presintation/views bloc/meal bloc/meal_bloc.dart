import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/all_meals.dart';
import '../../../data/models/meal_categories.dart';
import '../../../data/models/meal_detailes.dart';
import '../../../data/models/store_meals.dart';
import '../../../data/repo/meal_repo.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final MealRepo mealRepo;
  MealBloc(this.mealRepo) : super(MealInitial()) {
    on<GetAllMealesEvent>((event, emit) async{
      emit(GetAllMealsLoading());
      var result =await mealRepo.fetchAllMeal( event.breakfast, event.lunch, event.dinner, event.snack);
      result.fold((failed) =>emit(GetAllMealsFailed(failed.errMassage,failed.obj)) ,
            (plan) {
          emit(GetAllMealsSuccess(plan));
        },);
    });
    on<GetMealDetailesEvent>((event, emit) async{
      emit(GetMealDetailesLoading());
      var result =await mealRepo.fetchMealDetailes(event.Meal_id);
      result.fold((failed) =>emit(GeMealDetailesFailed(failed.errMassage,failed.obj)) ,
            (plan) {
          emit(GetMealDetailesSuccess(plan));
        },);
    });
    on<StoreMealEvent>((event, emit) async{
      emit(StoreMealsLoading());
      var result =await mealRepo.storeMeal(event.calories, event.check, event.plan_id);
      result.fold((failed) =>emit(StoreMealsFailed(failed.errMassage)) ,
            (plan) {
          emit(StoreMealsSuccess(plan));
        },);
    });
  }
}
