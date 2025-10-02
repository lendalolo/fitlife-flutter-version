import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/meal_categories.dart';
import '../../../data/repo/meal_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final MealRepo mealRepo;
  CategoriesBloc(this.mealRepo) : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      emit(GetMealsCategoriesLoading());
      var result =await mealRepo.fetchMealCategories();
      result.fold((failed) =>emit(GeMealsCategoriesFailed(failed.errMassage,failed.obj)) ,
            (plan) {
          emit(GetMealsCategoriesSuccess(plan));
        },);
    });
  }
}
