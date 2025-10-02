
import 'package:fitness/features/home/data/models/profile_model.dart';
import 'package:fitness/features/water%20tracker/data/model/StoreWaterModel.dart';
import 'package:fitness/features/water%20tracker/data/model/water_statistics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/servies_locator.dart';

abstract class WaterNetworkData{
  Future<WaterStatistics> fetchRemoteWaterStatistics();
  Future<StoreWater> storeWater(double amount);
}

class WaterNetworkDataImpl extends WaterNetworkData{
  final ApiService apiService;
  WaterNetworkDataImpl({ required this.apiService});
  @override
  Future<WaterStatistics> fetchRemoteWaterStatistics() async {
    Map<String,dynamic> data = await apiService.get(
      endPoint: 'plan/water?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
    );
    WaterStatistics profileModel;
    profileModel = WaterStatistics.fromJson(data);
    return profileModel;
  }

  @override
  Future<StoreWater> storeWater(double amount) async {
    Map<String,dynamic> data = await apiService.post(
        endPoint: 'target/storeWater?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??''
        ,query: {"water":amount}
    );

    StoreWater ExcerciesSubmit = StoreWater.fromJson(data);
    return ExcerciesSubmit;
  }

}