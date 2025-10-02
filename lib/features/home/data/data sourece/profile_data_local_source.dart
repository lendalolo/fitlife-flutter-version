
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/errors/exiptions.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../models/profile_model.dart';

abstract class ProfileStatisticLocalData{

  Future<Unit> cacheProfileStatistic(ProfileModel profileModel);

  ProfileModel fetchLocalProfileStatistic();
}

class ProfileStatisticLocalDataImpl extends ProfileStatisticLocalData{


  @override
  Future<Unit> cacheProfileStatistic(ProfileModel profileModel) {
    getIt.get<SharedPreferences>().setString(ProfileName, json.encode(profileModel));
    return Future.value(unit);
  }

  @override
  ProfileModel fetchLocalProfileStatistic() {
    final profileModel =getIt.get<SharedPreferences>().getString(ProfileName);
    if( profileModel!= null)
    {
      dynamic profileModeldecode = json.decode(profileModel);
      ProfileModel result = ProfileModel.fromJson(profileModeldecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

}