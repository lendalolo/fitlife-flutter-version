import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness/common/errors/failures.dart';
import 'package:fitness/features/home/data/models/profile_model.dart';
import 'package:fitness/features/home/data/repo/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/api_servieses.dart';
import '../../../../common/data sourses/locale_date_datasourse.dart';
import '../../../../common/data sourses/remote_date_datasourse.dart';
import '../../../../common/errors/exiptions.dart';
import '../../../../common/models/date_model.dart';
import '../../../../common/network_info.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../data sourece/profile_data_local_source.dart';
import '../data sourece/profile_data_remote_source.dart';

class ProfileStatisticsImpl extends ProfileStatistics {
  final ProfileNetworkData profileNetworkData;
  final ProfileStatisticLocalData profileStatisticLocalData;
  final NetworkInfo networkInfo;
  final ApiService apiService;
  final RemoteDateDatasourse remoteDateDatasourse;
  final LocalDateDataSourse localDateDataSourse;
  ProfileStatisticsImpl(this.apiService,
      this.networkInfo, this.remoteDateDatasourse, this.localDateDataSourse, this.profileNetworkData, this.profileStatisticLocalData);


  Either<Failure, ProfileModel> getChachedProfileStatisticWithNounError( Object e) {
    print(e);
    try {
      ProfileModel profileModel = profileStatisticLocalData.fetchLocalProfileStatistic() ;
      return left(
        ServerFailure(e.toString(), profileModel),
      );
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure(e.toString(), Null).errMassage}', Null));
    }
  }

  Either<Failure, ProfileModel> getChacedProfileStatisticWithDioError(DioException e) {
    print(e);
    try {
      ProfileModel profileModel = profileStatisticLocalData.fetchLocalProfileStatistic() ;
      return left(ServerFailure.fromDioException(e, profileModel));
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached and ${ServerFailure.fromDioException(e, Null).errMassage}', Null));
    }
  }

  Either<Failure, ProfileModel> getCashedProfileStatisticWithoutEroor() {
    try {
      final cachedProfileModel = profileStatisticLocalData.fetchLocalProfileStatistic();
      return Right(cachedProfileModel);
    } on EmptyCacheException {
      return left(EmptyCacheFailure('No Data is Cached', Null));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> fetchProfileStatistics() async {
    if (await networkInfo.internetConnection) {
      try {
        LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
        if (localDateDataSourse.fetchLastTimeUpdated(ProfileName) == null ||
            localDateDataSourse.fetchLastTimeUpdated(ProfileName)!.lastTime != date.lastTime ||
            getIt.get<SharedPreferences>().getString(ProfileName) == null
        ) {
          localDateDataSourse.cashLastTimeUpdated(date,ProfileName);
          try {
            ProfileModel plansList = await profileNetworkData.fetchRemoteProfileStatistics();
            profileStatisticLocalData.cacheProfileStatistic(plansList);
            return Right(plansList);
          } catch (e) {
            if (e is DioException) {
              return getChacedProfileStatisticWithDioError(e);
            }
            return getChachedProfileStatisticWithNounError( e);
          }
        }
        return getCashedProfileStatisticWithoutEroor();
      } catch (e) {
        if (e is DioException) {
          return getChacedProfileStatisticWithDioError(e);
        }
        return getChachedProfileStatisticWithNounError( e);
      }
    } else {
      return getCashedProfileStatisticWithoutEroor();
    }
  }

}