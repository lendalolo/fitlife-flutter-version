
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness/features/sleep_tracker/data/repo/sleep_repo.dart';
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
import '../data_source/loacl_sleep_data_source.dart';
import '../data_source/network_sleep_data_source.dart';
import '../model/StoreSleepModel.dart';
import '../model/sleep statistics.dart';

class SleepStatisticsImpl extends SleepStatisticsRepo {
  final SleepNetworkData sleepNetworkData;
  final SleepStatisticLocalData sleepStatisticLocalData;
  final NetworkInfo networkInfo;
  final ApiService apiService;
  final RemoteDateDatasourse remoteDateDatasourse;
  final LocalDateDataSourse localDateDataSourse;
  SleepStatisticsImpl(this.apiService,
      this.networkInfo, this.remoteDateDatasourse, this.localDateDataSourse, this.sleepNetworkData, this.sleepStatisticLocalData);


  Either<Failure, SleepStatistics> getChachedSleepStatisticWithNounError( Object e) {
    print(e);
    try {
      SleepStatistics sleepStatistics = sleepStatisticLocalData.fetchLocalSleepStatistic() ;
      return left(
        ServerFailure(e.toString(), SleepStatistics),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, SleepStatistics> getChacedSleepStatisticWithDioError(DioException e) {
    print(e);
    try {
      SleepStatistics SleepModel = sleepStatisticLocalData.fetchLocalSleepStatistic() ;
      return left(ServerFailure.fromDioException(e, SleepModel));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, SleepStatistics> getCashedSleepStatisticWithoutEroor() {
    try {
      final cachedSleepModel = sleepStatisticLocalData.fetchLocalSleepStatistic();
      return Right(cachedSleepModel);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  @override
  Future<Either<Failure, SleepStatistics>> fetchSleepStatistics() async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated(sleepStatisticsName) == null ||
            localDateDataSourse.fetchLastTimeUpdated(sleepStatisticsName)!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString(sleepStatisticsName) == null
        ) {
          localDateDataSourse.cashLastTimeUpdated(date,sleepStatisticsName);
          try {
            SleepStatistics plansList = await sleepNetworkData.fetchRemoteSleepStatistics();
            sleepStatisticLocalData.cacheSleepStatistic(plansList);
            return Right(plansList);
          } catch (e) {
            if (e is DioException) {
              return getChacedSleepStatisticWithDioError(e);
            }
            return getChachedSleepStatisticWithNounError( e);
          }
        }
        return getCashedSleepStatisticWithoutEroor();
      } catch (e) {
        if (e is DioException) {
          return getChacedSleepStatisticWithDioError(e);
        }
        return getChachedSleepStatisticWithNounError( e);
      }
    } else {
      return getCashedSleepStatisticWithoutEroor();
    }
  }

  @override
  Future<Either<Failure, StoreSleepModel>> storeSleep(int h) async {
    try {
      StoreSleepModel storeSleep = await sleepNetworkData.storeSleep(h);
      return Right(storeSleep);
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
  }