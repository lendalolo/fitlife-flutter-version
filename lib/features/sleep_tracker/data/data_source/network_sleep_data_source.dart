
import 'package:fitness/features/sleep_tracker/data/model/StoreSleepModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/servies_locator.dart';
import '../model/sleep statistics.dart';

abstract class SleepNetworkData{
  Future<SleepStatistics> fetchRemoteSleepStatistics();
  Future<StoreSleepModel> storeSleep(int hours);
}

class SleepNetworkDataImpl extends SleepNetworkData{
  final ApiService apiService;
  SleepNetworkDataImpl({ required this.apiService});
  @override
  Future<SleepStatistics> fetchRemoteSleepStatistics() async {
    Map<String,dynamic> data = await apiService.get(
      endPoint: 'plan/sleep?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
    );
    SleepStatistics profileModel;
    profileModel = SleepStatistics.fromJson(data);
    return profileModel;
  }

  @override
  Future<StoreSleepModel> storeSleep(int hours) async {
    Map<String,dynamic> data = await apiService.post(
        endPoint: 'target/storeSleep?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
        query: {"hours":hours}
    );

    StoreSleepModel ExcerciesSubmit = StoreSleepModel.fromJson(data);
    return ExcerciesSubmit;
  }

}