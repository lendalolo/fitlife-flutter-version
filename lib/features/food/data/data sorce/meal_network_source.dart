
import 'package:fitness/features/food/data/models/all_meals.dart';
import 'package:fitness/features/food/data/models/meal_categories.dart';
import 'package:fitness/features/food/data/models/meal_detailes.dart';
import 'package:fitness/features/food/data/models/store_meals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/servies_locator.dart';


abstract class MealNetworkData{
  Future<AllMyMeals> fetchRemoteAllMeal(int breakfast,int lunch,int dinner,int snack);
  Future<StoreMeal> storMeal(List<int> calories, List<int> check,int plan_id);
  Future<MealDetailes> fetchRemoteMealDetailes(int Meal_id);
  Future<MealCategories> fetchRemoteMealCategories();
}
class MealNetworkDataImpl extends MealNetworkData{
  final ApiService apiService;
  MealNetworkDataImpl({ required this.apiService});

  @override
  Future<AllMyMeals> fetchRemoteAllMeal( int breakfast, int lunch, int dinner, int snack) async {
      Map<String,dynamic> data = await apiService.post(
          endPoint: 'plan/meals?lang=${getIt.get<SharedPreferences>().getString('lang')}',
          token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
          query: {'breakfast':'$breakfast','lunch':'$lunch','dinner':'$dinner','snack':'$snack'}
      );
      AllMyMeals AllMyMealsList;
      AllMyMealsList = AllMyMeals.fromJson(data);
      // print(ExcerciesList.isChecked);
      return AllMyMealsList;
  }

  @override
  Future<MealCategories> fetchRemoteMealCategories() async {
    Map<String,dynamic> data = await apiService.get(
        endPoint: 'meal/category?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??''
    );
    MealCategories AllMealsCategories;
    AllMealsCategories = MealCategories.fromJson(data);
    // print(ExcerciesList.isChecked);
    return AllMealsCategories;
  }

  @override
  Future<MealDetailes> fetchRemoteMealDetailes(int Meal_id) async {
    Map<String,dynamic> data = await apiService.get(
        endPoint: 'meal/$Meal_id/show?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??''
    );
    MealDetailes mealDetailes;
    mealDetailes = MealDetailes.fromJson(data);
    // print(ExcerciesList.isChecked);
    return mealDetailes;
  }

  @override
  Future<StoreMeal> storMeal(List<int> calories, List<int> check, int plan_id) async {
    final lang = getIt.get<SharedPreferences>().getString('lang') ?? 'en';
    final body = {
      "calories": calories,
      "check": check,
      "plan_id": plan_id,
      "lang": lang,
    };
    Map<String, dynamic> data = await apiService.post(
      endPoint: 'target/store?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation?.token.toString() ?? '',
    data:body
    );

    return StoreMeal.fromJson(data);
  }

// Future<StoreMeal> storMeal(List<int> calories, List<int> check, int plan_id) async {
  //
  //   String buildCommaList(List<int> items) => items.join(',');
  //
  //   Map<String,dynamic> data = await apiService.post(
  //       endPoint: 'target/store?calories[0]=${buildCommaList(calories)}&check[0]=${buildCommaList(check)}&plan_id=${plan_id}lang=${getIt.get<SharedPreferences>().getString('lang')}',
  //       token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'', query: {},
  //
  //   );
  //   StoreMeal storeMeal;
  //   storeMeal = StoreMeal.fromJson(data);
  //   // print(ExcerciesList.isChecked);
  //   return storeMeal;
  // }
}