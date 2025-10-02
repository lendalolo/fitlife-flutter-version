
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness/features/water%20tracker/data/repo/water_repo.dart';

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
import '../data sourse/local_water_data_sourse.dart';
import '../data sourse/network_water_data_sourse.dart';
import '../model/StoreWaterModel.dart';
import '../model/water_statistics.dart';

class WaterStatisticsImpl extends WaterStatisticsRepo {
  final WaterNetworkData waterNetworkData;
  final WaterStatisticLocalData waterStatisticLocalData;
  final NetworkInfo networkInfo;
  final ApiService apiService;
  final RemoteDateDatasourse remoteDateDatasourse;
  final LocalDateDataSourse localDateDataSourse;
  WaterStatisticsImpl(this.apiService,
      this.networkInfo, this.remoteDateDatasourse, this.localDateDataSourse, this.waterNetworkData, this.waterStatisticLocalData);


  Either<Failure, WaterStatistics> getChachedWaterStatisticWithNounError( Object e) {
    print(e);
    try {
      WaterStatistics waterStatistics = waterStatisticLocalData.fetchLocalWaterStatistic() ;
      return left(
        ServerFailure(e.toString(), WaterStatistics),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, WaterStatistics> getChacedWaterStatisticWithDioError(DioException e) {
    print(e);
    try {
      WaterStatistics WaterModel = waterStatisticLocalData.fetchLocalWaterStatistic() ;
      return left(ServerFailure.fromDioException(e, WaterModel));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, WaterStatistics> getCashedWaterStatisticWithoutEroor() {
    try {
      final cachedWaterModel = waterStatisticLocalData.fetchLocalWaterStatistic();
      return Right(cachedWaterModel);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  @override
  Future<Either<Failure, WaterStatistics>> fetchWaterStatistics() async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated(WaterStatisticName) == null ||
            localDateDataSourse.fetchLastTimeUpdated(WaterStatisticName)!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString(WaterStatisticName) == null
        ) {
          localDateDataSourse.cashLastTimeUpdated(date,WaterStatisticName);
          try {
            WaterStatistics plansList = await waterNetworkData.fetchRemoteWaterStatistics();
            waterStatisticLocalData.cacheWaterStatistic(plansList);
            return Right(plansList);
          } catch (e) {
            if (e is DioException) {
              return getChacedWaterStatisticWithDioError(e);
            }
            return getChachedWaterStatisticWithNounError( e);
          }
        }
        return getCashedWaterStatisticWithoutEroor();
      } catch (e) {
        if (e is DioException) {
          return getChacedWaterStatisticWithDioError(e);
        }
        return getChachedWaterStatisticWithNounError( e);
      }
    } else {
      return getCashedWaterStatisticWithoutEroor();
    }
  }

  @override
  Future<Either<Failure, StoreWater>> storeWater(double amount) async {
    try {
      StoreWater storeWater = await waterNetworkData.storeWater(amount);
      return Right(storeWater);
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