import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness/common/errors/exiptions.dart';
import 'package:fitness/common/errors/failures.dart';
import 'package:fitness/features/workout_tracker/data/models/AddGoalMoreDay.dart';
import 'package:fitness/features/workout_tracker/data/models/goales_model.dart';
import 'package:fitness/features/workout_tracker/data/models/user_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/data sourses/locale_date_datasourse.dart';
import '../../../../common/data sourses/remote_date_datasourse.dart';
import '../../../../common/models/date_model.dart';
import '../../../../common/network_info.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../data sources/local data sourse/sport_local_data.dart';
import '../data sources/network data source/sport_network_data.dart';
import 'goales_repo.dart';

class GoalsRepoImpl extends GoalsRepo{
  final ApiService apiService;
  final SportNetworkData sportNetworkData;
  final SportLocalData  sportLocalData;
  final NetworkInfo networkInfo;
  final RemoteDateDatasourse remoteDateDatasourse;
  final LocalDateDataSourse localDateDataSourse;
  GoalsRepoImpl(this.apiService, this.sportNetworkData, this.sportLocalData, this.networkInfo, this.remoteDateDatasourse, this.localDateDataSourse);
  @override
  Future<Either<Failure, Goales>> fetchGoals() async {
    if(await networkInfo.internetConnection)
      {
        try{
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if(localDateDataSourse.fetchLastTimeUpdated(GoalsName)==null ||localDateDataSourse.fetchLastTimeUpdated(GoalsName)!.lastTime != date.lastTime ||getIt.get<SharedPreferences>().getString(GoalsName) ==null) {
          localDateDataSourse.cashLastTimeUpdated(date,GoalsName);
          print('goal repo goal impl');
          try{
          Goales  goales = await sportNetworkData.fetchRemoteGoals();
          sportLocalData.cacheGoal(goales);
          return Right(goales);
        }catch(e) {
          return getChachedGoalesWhenThereIsError(e);
        }
        }
        else{
          return getcasheGoalesWithNoDataCach();
        }}
        catch(e) {
          return getChachedGoalesWhenThereIsError(e);
        }
      }
    return getcasheGoalesWithNoDataCach();
  }
  Either<Failure, Goales> getChachedGoalesWhenThereIsError(Object e) {
     if (e is DioException) {
      print(e);
      try{
        final cachedGoales = sportLocalData.fetchGoal();
        return left(ServerFailure.fromDioException(e,cachedGoales));
      }on EmptyCacheException{
        return left(EmptyCacheFailure('No Data is Cached and there is ${ServerFailure.fromDioException(e,Null).errMassage}',Null));
      }
    }
    print(e);
    return getCacheGoalesWithNounError(e);
  }

  Either<Failure, Goales> getCacheGoalesWithNounError(Object e) {
   try{
     final cachedGoales = sportLocalData.fetchGoal();
     return left(ServerFailure(e.toString(),cachedGoales),);
   }on EmptyCacheException{
     return left(EmptyCacheFailure('No Data is Cached${ServerFailure(e.toString(),Null).errMassage}',Null));
   }
  }
  Either<Failure, Goales> getcasheGoalesWithNoDataCach() {
     try{
      final cachedGoales = sportLocalData.fetchGoal();
      return Right(cachedGoales);
    }on EmptyCacheException{
      return left(EmptyCacheFailure('No Data is Cached',Null));
     }
  }

  @override
  Either<Failure, Goales> fetchGoalsFromCashe() {
    return getcasheGoalesWithNoDataCach();
  }

  @override
  Future<Either<Failure, AddGoalMoreDay>> addday() async {
    try {
      AddGoalMoreDay addGoalMoreDay = await sportNetworkData.addday();
      return Right(addGoalMoreDay);
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
  Future<Either<Failure, AddGoalMoreDay>> noAddday() async {
    try {
      AddGoalMoreDay addGoalMoreDay = await sportNetworkData.noAddday();
      return Right(addGoalMoreDay);
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
  Future<Either<Failure, UserStautsModel>> getUserStatus() async {
    try {
      UserStautsModel addGoalMoreDay = await sportNetworkData.getUserStatus();
      return Right(addGoalMoreDay);
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