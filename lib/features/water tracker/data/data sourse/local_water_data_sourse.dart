
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fitness/features/water%20tracker/data/model/StoreWaterModel.dart';
import 'package:fitness/features/water%20tracker/data/model/water_statistics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/errors/exiptions.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';


abstract class WaterStatisticLocalData{
  Future<Unit> cacheWaterStatistic(WaterStatistics waterStatistic);
  WaterStatistics fetchLocalWaterStatistic();
}

class WaterStatisticLocalDataImpl extends WaterStatisticLocalData{
  @override
  Future<Unit> cacheWaterStatistic(WaterStatistics profileModel) {
    getIt.get<SharedPreferences>().setString(WaterStatisticName, json.encode(profileModel));
    return Future.value(unit);
  }

  @override
  WaterStatistics fetchLocalWaterStatistic() {
    final profileModel =getIt.get<SharedPreferences>().getString(WaterStatisticName);
    if( profileModel!= null)
    {
      dynamic profileModeldecode = json.decode(profileModel);
      WaterStatistics result = WaterStatistics.fromJson(profileModeldecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }



}