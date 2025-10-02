import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fitness/features/food/data/models/all_meals.dart';

import 'package:fitness/features/food/data/models/meal_categories.dart';

import 'package:fitness/features/food/data/models/meal_detailes.dart';

import 'package:fitness/features/food/data/models/store_meals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/api_servieses.dart';
import '../../../../common/data sourses/locale_date_datasourse.dart';
import '../../../../common/data sourses/remote_date_datasourse.dart';
import '../../../../common/errors/exiptions.dart';
import '../../../../common/errors/failures.dart';
import '../../../../common/models/date_model.dart';
import '../../../../common/network_info.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../data sorce/meal_local_source.dart';
import '../data sorce/meal_network_source.dart';
import 'meal_repo.dart';

class MealRepoImpl extends MealRepo {
  final MealNetworkData mealNetworkData;
  final MealLocalData mealLocalData;
  final NetworkInfo networkInfo;
  final ApiService apiService;
  final RemoteDateDatasourse remoteDateDatasourse;
  final LocalDateDataSourse localDateDataSourse;
  MealRepoImpl(this.apiService, this.mealNetworkData, this.mealLocalData, this.networkInfo, this.remoteDateDatasourse, this.localDateDataSourse);

  @override
  Future<Either<Failure, AllMyMeals>> fetchAllMeal( int breakfast, int lunch, int dinner, int snack) async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated('$AllMealsName$breakfast$lunch$dinner$snack') == null ||
            localDateDataSourse.fetchLastTimeUpdated('$AllMealsName$breakfast$lunch$dinner$snack')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('$AllMealsName$breakfast$lunch$dinner$snack') == null)
        {
          localDateDataSourse.cashLastTimeUpdated(date,'$AllMealsName$breakfast$lunch$dinner$snack');
          try {
            AllMyMeals allMyMealsList = await mealNetworkData.fetchRemoteAllMeal(  breakfast, lunch, dinner,  snack);
            mealLocalData.cacheAllMeales(allMyMealsList, breakfast, lunch, dinner, snack);
            return Right(allMyMealsList);
          } catch (e) {
            if (e is DioException) {
              return getChacedMealWithDioError(e, breakfast, lunch, dinner, snack);
            }
            return getChachedMealWithNounError(breakfast, lunch, dinner, snack,e);
          }
        }
        return getCashedMealWithoutEroor( breakfast, lunch, dinner, snack);
      } catch (e) {
        if (e is DioException) {
          return getChacedMealWithDioError(e, breakfast, lunch, dinner, snack);
        }
        return getChachedMealWithNounError( breakfast, lunch, dinner, snack,e);
      }
    }
    else {
      return getCashedMealWithoutEroor( breakfast, lunch, dinner, snack);
    }
  }
  Either<Failure, AllMyMeals> getChachedMealWithNounError( int breakfast, int lunch, int dinner, int snack, Object e) {
    try {
      AllMyMeals meals = mealLocalData.fetchLocalAllMeal(breakfast, lunch, dinner, snack);
      return left(
        ServerFailure(e.toString(), meals),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, AllMyMeals> getChacedMealWithDioError(DioException e, int breakfast, int lunch, int dinner, int snack) {
    print(e);
    try {
      AllMyMeals meal = mealLocalData.fetchLocalAllMeal( breakfast, lunch, dinner, snack);
      return left(ServerFailure.fromDioException(e, meal));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, AllMyMeals> getCashedMealWithoutEroor( int breakfast, int lunch, int dinner, int snack) {
    try {
      final cachedPlans = mealLocalData.fetchLocalAllMeal(breakfast, lunch, dinner, snack);
      return Right(cachedPlans);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  Either<Failure, MealCategories> getCachedMealCatigoriesWithNounError( Object e) {
    try {
      MealCategories meals = mealLocalData.fetchLocalMealCategories();
      return left(
        ServerFailure(e.toString(), meals),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, MealCategories> getChacedMealCatigoriesWithDioError(DioException e) {
    print(e);
    try {
      MealCategories meal = mealLocalData.fetchLocalMealCategories();
      return left(ServerFailure.fromDioException(e, meal));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, MealCategories> getCashedMealCatigoriesWithoutEroor() {
    try {
      final cachedPlans = mealLocalData.fetchLocalMealCategories();
      return Right(cachedPlans);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  @override
  Future<Either<Failure, MealCategories>> fetchMealCategories() async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated('$MealCategoriesName') == null ||
            localDateDataSourse.fetchLastTimeUpdated('$MealCategoriesName')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('$MealCategoriesName') == null)
        {
          localDateDataSourse.cashLastTimeUpdated(date,'$MealCategoriesName');
          try {
            MealCategories categoresList = await mealNetworkData.fetchRemoteMealCategories();
            mealLocalData.cacheMealesCategores(categoresList);
            return Right(categoresList);
          } catch (e) {
            if (e is DioException) {
              return getChacedMealCatigoriesWithDioError(e);
            }
            return getCachedMealCatigoriesWithNounError(e);
          }
        }
        return getCashedMealCatigoriesWithoutEroor();
      } catch (e) {
        if (e is DioException) {
          return getChacedMealCatigoriesWithDioError(e);
        }
        return getCachedMealCatigoriesWithNounError(e);
      }
    }
    else {
      return getCashedMealCatigoriesWithoutEroor();
    }
  }

  @override
  Future<Either<Failure, MealDetailes>> fetchMealDetailes(int Meal_id) async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated('$MealDetailesName$Meal_id') == null ||
            localDateDataSourse.fetchLastTimeUpdated('$MealDetailesName$Meal_id')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('$MealDetailesName$Meal_id') == null)
        {
          localDateDataSourse.cashLastTimeUpdated(date,'$MealDetailesName$Meal_id');
          try {
            MealDetailes categoresList = await mealNetworkData.fetchRemoteMealDetailes(Meal_id);
            mealLocalData.cacheAllMealesDetailes(categoresList,Meal_id);
            return Right(categoresList);
          } catch (e) {
            if (e is DioException) {
              return getChacedMealDetailesWithDioError(e,Meal_id);
            }
            return getCachedMealDetailesWithNounError(e,Meal_id);
          }
        }
        return getCashedMealDetailesWithoutEroor(Meal_id);
      } catch (e) {
        if (e is DioException) {
          return getChacedMealDetailesWithDioError(e,Meal_id);
        }
        return getCachedMealDetailesWithNounError(e,Meal_id);
      }
    }
    else {
      return getCashedMealDetailesWithoutEroor(Meal_id);
    }
  }
  Either<Failure, MealDetailes> getCachedMealDetailesWithNounError( Object e,int Meal_id) {
    try {
      MealDetailes meals = mealLocalData.fetchLocalMealDetailes(Meal_id);
      return left(
        ServerFailure(e.toString(), meals),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, MealDetailes> getChacedMealDetailesWithDioError(DioException e,int Meal_id) {
    print(e);
    try {
      MealDetailes meal = mealLocalData.fetchLocalMealDetailes(Meal_id);
      return left(ServerFailure.fromDioException(e, meal));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, MealDetailes> getCashedMealDetailesWithoutEroor(int Meal_id) {
    try {
      MealDetailes cachedPlans = mealLocalData.fetchLocalMealDetailes(Meal_id);
      return Right(cachedPlans);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }
  @override
  Future<Either<Failure, StoreMeal>> storeMeal(List<int> calories, List<int> check, int plan_id) async {
    try {
      StoreMeal storeMeal = await mealNetworkData.storMeal( calories,check, plan_id);
      return Right(storeMeal);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e, Null));
      }
      print(e);
      return left(
        ServerFailure(e.toString(), Null),
      );
    }
  }


}
