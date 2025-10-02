import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness/common/errors/failures.dart';
import 'package:fitness/features/workout_tracker/data/models/Exercies_submit.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_model.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_statestics.dart';
import 'package:fitness/features/workout_tracker/data/models/regester_in_goal_model.dart';
import 'package:fitness/features/workout_tracker/data/models/today_target_model.dart';
import 'package:fitness/features/workout_tracker/data/repo/plans_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/data sourses/locale_date_datasourse.dart';
import '../../../../common/data sourses/remote_date_datasourse.dart';
import '../../../../common/errors/exiptions.dart';
import '../../../../common/models/date_model.dart';
import '../../../../common/network_info.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../data sources/local data sourse/sport_local_data.dart';
import '../data sources/network data source/sport_network_data.dart';
import '../models/exercies_detailes_models.dart';
import '../models/exercieses_model.dart';

class PlansRepoImpl extends PlansRepo {
  final SportNetworkData sportNetworkData;
  final SportLocalData sportLocalData;
  final NetworkInfo networkInfo;
  final ApiService apiService;
  final RemoteDateDatasourse remoteDateDatasourse;
  final LocalDateDataSourse localDateDataSourse;
  PlansRepoImpl(this.apiService, this.sportNetworkData, this.sportLocalData,
      this.networkInfo, this.remoteDateDatasourse, this.localDateDataSourse);
  @override
  Future<Either<Failure, plans>> fetchPlans(int goalNum) async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated('$PlansName$goalNum') == null ||
            localDateDataSourse.fetchLastTimeUpdated('$PlansName$goalNum')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('$PlansName$goalNum') == null
            // ||
            // getIt.get<SharedPreferences>().getString('user') != null
        ) {
          localDateDataSourse.cashLastTimeUpdated(date,'$PlansName$goalNum');
          try {
            plans plansList = await sportNetworkData.fetchRemotePlans(goalNum);
            sportLocalData.cachePlans(plansList, goalNum);
            return Right(plansList);
          } catch (e) {
            if (e is DioException) {
              return getChacedPlanesWithDioError(e, goalNum);
            }
            return getChachedPlanesWithNounError(goalNum, e);
          }
        }
        return getCashedPlanedWithoutEroor(goalNum);
      } catch (e) {
        if (e is DioException) {
          return getChacedPlanesWithDioError(e, goalNum);
        }
        return getChachedPlanesWithNounError(goalNum, e);
      }
    } else {
      return getCashedPlanedWithoutEroor(goalNum);
    }
  }

  Either<Failure, plans> getChachedPlanesWithNounError(int goalNum, Object e) {
    try {
      plans plan = sportLocalData.fetchPlans(goalNum);
      return left(
        ServerFailure(e.toString(), plan),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, plans> getChacedPlanesWithDioError(
      DioException e, int goalNum) {
    print(e);
    try {
      plans plan = sportLocalData.fetchPlans(goalNum);
      return left(ServerFailure.fromDioException(e, plan));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, plans> getCashedPlanedWithoutEroor(int goalNum) {
    try {
      final cachedPlans = sportLocalData.fetchPlans(goalNum);
      return Right(cachedPlans);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

//
  @override
  Future<Either<Failure, Exercieses>> fetchPlansExercies(int planNum) async {
    if (await networkInfo.internetConnection) {
      try{
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated('${ExerciesName}$planNum') == null||
            localDateDataSourse.fetchLastTimeUpdated('${ExerciesName}$planNum')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('${ExerciesName}$planNum') == null
            // ||
            // getIt.get<SharedPreferences>().getString('user') != null
        )
          {      localDateDataSourse.cashLastTimeUpdated(date,'${ExerciesName}$planNum');
            try {
              Exercieses ExcerciesList = await sportNetworkData.fetchRemoteExercies(
                  planNum);
              sportLocalData.cacheExersices(ExcerciesList, planNum);
              return Right(ExcerciesList);
            } catch (e) {
              if (e is DioException) {
                return getCachedExersicesWithDioExiption(e, planNum);
              }
              return getCachedExersisesWithNounError(planNum, e);
            }
          }
        return getCachedExercisesWithoutError(planNum);
      }catch (e){
        if (e is DioException) {
          return getCachedExersicesWithDioExiption(e, planNum, );
        }
        return getCachedExersisesWithNounError(planNum,  e);
      }
    } else {
      return getCachedExercisesWithoutError(planNum);
    }
  }

  Either<Failure, Exercieses> getCachedExercisesWithoutError(int planNum) {
      try {
      final cachedExercies =
          sportLocalData.fetchExersices(planNum);
      return Right(cachedExercies);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  Either<Failure, Exercieses> getCachedExersisesWithNounError(int planNum, Object e) {
     try{
      final cachedExercies = sportLocalData.fetchExersices(planNum);
      print(e);
      return left(
        ServerFailure(e.toString(), cachedExercies),
      );
    }on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(),Null).errMassage}', Null));
    }
  }

  Either<Failure, Exercieses> getCachedExersicesWithDioExiption(DioException e, int planNum) {
    try{
      print(e);
      final cachedExercies = sportLocalData.fetchExersices(planNum);
      return left(ServerFailure.fromDioException(e, cachedExercies));
    }on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  @override
  Future<Either<Failure, ExerciesDetailes>> fetchPlansExerciesDetailes(int exerciesId) async {
    if (await networkInfo.internetConnection) {
      try{
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated('${ExerciesDetailsName}$exerciesId')== null
            ||localDateDataSourse.fetchLastTimeUpdated('${ExerciesDetailsName}$exerciesId')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('${ExerciesDetailsName}$exerciesId') == null)
        {      localDateDataSourse.cashLastTimeUpdated(date,'${ExerciesDetailsName}$exerciesId');
        try {
          ExerciesDetailes ExcerciesList = await sportNetworkData.fetchRemoteExerciesDetailes(exerciesId);
          sportLocalData.chacheRemoteExerciesDetailes(exerciesId,ExcerciesList);
          return Right(ExcerciesList);
        } catch (e) {
          if (e is DioException) {
            return getCachedExersicesDetailesWithDioExiption(e, exerciesId);
          }
          return getCachedExersisesDetailesWithNounError(exerciesId, e);
        }
        }
        return getCachedExercisesDetailesWithoutError(exerciesId);
      }catch (e){
        if (e is DioException) {
          return getCachedExersicesDetailesWithDioExiption(e, exerciesId);
        }
        return getCachedExersisesDetailesWithNounError(exerciesId, e);
      }
    } else {
      return getCachedExercisesDetailesWithoutError(exerciesId);
    }
  }

  Either<Failure, ExerciesDetailes> getCachedExersicesDetailesWithDioExiption(DioException e, int exerciesId) {
    try{
      print(e);
      final cachedExercies = sportLocalData.fetchRemoteExerciesDetailes(exerciesId);
      return left(ServerFailure.fromDioException(e, cachedExercies));
    }on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e,{}).errMassage}', Null));
    }
  }

 Either<Failure, ExerciesDetailes> getCachedExersisesDetailesWithNounError(int exerciesId, Object e) {
   try{
     final cachedExercies = sportLocalData.fetchRemoteExerciesDetailes(exerciesId);
     print(e);
     return left(
       ServerFailure(e.toString(), cachedExercies),
     );
   }on EmptyCacheException {
     return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(),Null).errMassage}', Null));
   }
 }

  Either<Failure, ExerciesDetailes> getCachedExercisesDetailesWithoutError(int exerciesId) {
    try {
      final cachedExercies = sportLocalData.fetchRemoteExerciesDetailes(exerciesId);
      return Right(cachedExercies);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  @override
  Future<Either<Failure, exerciesSubmit>> submitExercies(int check, int planId, int calories) async {
    try {
      exerciesSubmit ExcerciesList = await sportNetworkData
          .submitRemoteExercies(check, planId, calories);
      return Right(ExcerciesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e, Null));
      }
      print(e);
      return left(
        ServerFailure(e.toString(), Null),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterInGoal>> submitGoal(int goalId) async {
    try {
      RegisterInGoal registerStatus = await sportNetworkData.submitGoal(goalId);
      return Right(registerStatus);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e, Null));
      }
      print(e);
      return left(
        ServerFailure(e.toString(), Null),
      );
    }
  }

  @override
  Future<Either<Failure, PlansStatesitics>> FetchPlaneStatistics(int planId) async {
    if (await networkInfo.internetConnection) {
      try{
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (
        localDateDataSourse.fetchLastTimeUpdated('${PlansStatesiticsName}$planId') == null||
            localDateDataSourse.fetchLastTimeUpdated('${PlansStatesiticsName}$planId')!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString('${PlansStatesiticsName}$planId') == null
        )
        {      localDateDataSourse.cashLastTimeUpdated(date,'${PlansStatesiticsName}$planId');
        try {
          PlansStatesitics plansStatesitics = await sportNetworkData.FetchPlaneStatistics(planId);
          sportLocalData.cachePlaneStatistics(plansStatesitics, planId);
          return Right(plansStatesitics);
        } catch (e) {
          if (e is DioException) {
            print("$e ooooooooooooooooooooo");
            return getCachedPlansStatesiticsWithDioExiption(e, planId);
          }
          return getCachedPlansStatesiticsWithNounError(planId, e);
        }
        }
        return getCachedPlansStatesiticsWithoutError(planId);
      }catch (e){
        if (e is DioException) {
          print("$e ooooooooooooooooooooo");
          return getCachedPlansStatesiticsWithDioExiption(e, planId);
        }
        return getCachedPlansStatesiticsWithNounError(planId, e);
      }
    } else {
      return getCachedPlansStatesiticsWithoutError(planId);
    }

  }

  Either<Failure, PlansStatesitics> getCachedPlansStatesiticsWithoutError(int planId) {
    try {
      final planeStatistics = sportLocalData.FetchPlaneStatistics(planId);
      return Right(planeStatistics);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  Either<Failure, PlansStatesitics> getCachedPlansStatesiticsWithNounError(int planId, Object e) {
    try{
      final planeStatistics = sportLocalData.FetchPlaneStatistics(planId);
      print(e);
      return left(
        ServerFailure(e.toString(), planeStatistics),
      );
    }on EmptyCacheException {
      print(e);
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(),Null).errMassage}', Null));
    }
  }

  Either<Failure, PlansStatesitics> getCachedPlansStatesiticsWithDioExiption(DioException e, int planId) {
    try{
      print(e);
      final planeStatistics = sportLocalData.FetchPlaneStatistics(planId);
      return left(ServerFailure.fromDioException(e, planeStatistics));
    }on EmptyCacheException {
      print(e);
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }


  @override
  Future<Either<Failure, TodayTargetModel>> fetchTodayTarget() async {
    if (await networkInfo.internetConnection) {
      try{
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if ( true
        // localDateDataSourse.fetchLastTimeUpdated(TodayTargetName) == null||
        //     localDateDataSourse.fetchLastTimeUpdated(TodayTargetName)!.lastTime != date.lastTime ||
        //     getIt.get<SharedPreferences>().getString(TodayTargetName) == null
        )
        {      localDateDataSourse.cashLastTimeUpdated(date,'$TodayTargetName');
        try {
          TodayTargetModel todayTargetModel = await sportNetworkData.fetchTodayTarget();
          sportLocalData.cacheTodayTarget(todayTargetModel);
          return Right(todayTargetModel);
        } catch (e) {
          if (e is DioException) {
            return getCachedTodayTargetWithDioExiption(e);
          }
          return getCachedTodayTargetWithNounError( e);
        }
        }
        return getCachedTodayTargetWithoutError();
      }catch (e){
        if (e is DioException) {
          return getCachedTodayTargetWithDioExiption(e);
        }
        return getCachedTodayTargetWithNounError( e);
      }
    } else {
      return getCachedTodayTargetWithoutError();
    }
  }
  Either<Failure, TodayTargetModel> getCachedTodayTargetWithoutError() {
    try {
      final todayTarget = sportLocalData.fetchTodayTarget();
      return Right(todayTarget);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  Either<Failure, TodayTargetModel> getCachedTodayTargetWithNounError( Object e) {
    try{
      final todayTarget = sportLocalData.fetchTodayTarget();
      print(e);
      return left(
        ServerFailure(e.toString(), todayTarget),
      );
    }on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(),Null).errMassage}', Null));
    }
  }

  Either<Failure, TodayTargetModel> getCachedTodayTargetWithDioExiption(DioException e) {
    try{
      print(e);
      final todayTarget = sportLocalData.fetchTodayTarget();
      return left(ServerFailure.fromDioException(e, todayTarget));
    }on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }


}
