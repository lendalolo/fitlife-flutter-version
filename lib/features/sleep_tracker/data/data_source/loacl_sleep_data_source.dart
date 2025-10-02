
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/errors/exiptions.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../model/sleep statistics.dart';


abstract class SleepStatisticLocalData{
  Future<Unit> cacheSleepStatistic(SleepStatistics sleepStatistic);
  SleepStatistics fetchLocalSleepStatistic();
}

class SleepStatisticLocalDataImpl extends SleepStatisticLocalData{
  @override
  Future<Unit> cacheSleepStatistic(SleepStatistics sleepStatistic) {
    getIt.get<SharedPreferences>().setString(sleepStatisticsName, json.encode(sleepStatistic));
    return Future.value(unit);
  }

  @override
  SleepStatistics fetchLocalSleepStatistic() {
    final sleepStatistic =getIt.get<SharedPreferences>().getString(sleepStatisticsName);
    if( sleepStatistic!= null)
    {
      dynamic sleepStatisticdecode = json.decode(sleepStatistic);
      SleepStatistics result = SleepStatistics.fromJson(sleepStatisticdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }



}