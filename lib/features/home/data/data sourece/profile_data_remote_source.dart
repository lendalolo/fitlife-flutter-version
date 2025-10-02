
import 'package:fitness/features/home/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/servies_locator.dart';

abstract class ProfileNetworkData{
  Future<ProfileModel> fetchRemoteProfileStatistics();
}

class ProfileNetworkDataImpl extends ProfileNetworkData{
  final ApiService apiService;
  ProfileNetworkDataImpl({ required this.apiService});
  @override
  Future<ProfileModel> fetchRemoteProfileStatistics() async {
    Map<String,dynamic> data = await apiService.get(
        endPoint: 'user/profile?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
    );
    ProfileModel profileModel;
    profileModel = ProfileModel.fromJson(data);
    return profileModel;
  }

}