
import 'package:dio/dio.dart';
import 'package:fitness/common/data%20sourses/locale_date_datasourse.dart';
import 'package:fitness/common/repos/last_update_database_reop_impl.dart';
import 'package:fitness/features/home/data/data%20sourece/profile_data_local_source.dart';
import 'package:fitness/features/home/data/data%20sourece/profile_data_remote_source.dart';
import 'package:fitness/features/home/data/repo/profile_repo.dart';
import 'package:fitness/features/home/data/repo/profile_repo_impl.dart';
import 'package:fitness/features/sleep_tracker/data/model/sleep%20statistics.dart';
import 'package:fitness/features/sleep_tracker/data/repo/sleep_repo_impl.dart';
import 'package:fitness/features/water%20tracker/data/data%20sourse/local_water_data_sourse.dart';
import 'package:fitness/features/water%20tracker/data/data%20sourse/network_water_data_sourse.dart';
import 'package:fitness/features/water%20tracker/data/repo/water_repo.dart';
import 'package:fitness/features/workout_tracker/data/data%20sources/local%20data%20sourse/sport_local_data.dart';
import 'package:fitness/features/workout_tracker/data/data%20sources/network%20data%20source/sport_network_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/data/reop/register_repo_impl.dart';
import '../features/food/data/data sorce/meal_local_source.dart';
import '../features/food/data/data sorce/meal_network_source.dart';
import '../features/food/data/repo/meal_repo_impl.dart';
import '../features/sleep_tracker/data/data_source/loacl_sleep_data_source.dart';
import '../features/sleep_tracker/data/data_source/network_sleep_data_source.dart';
import '../features/water tracker/data/repo/water_repo_impl.dart';
import '../features/workout_tracker/data/repo/goales_repo_impl.dart';
import '../features/workout_tracker/data/repo/plans_repo_impl.dart';
import 'Shared pref helper/user_cache_helper.dart';
import 'api_servieses.dart';
import 'data sourses/remote_date_datasourse.dart';
import 'network_info.dart';

final getIt = GetIt.instance;
  setUp() {
    getIt.registerSingleton<ApiService>(ApiService(Dio()));
    getIt.registerSingleton<AuthImpl>(AuthImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<SportNetworkDataImpl>(SportNetworkDataImpl(apiService: getIt.get<ApiService>()));
    getIt.registerSingleton<SportLocalDataImpl>(SportLocalDataImpl());
    getIt.registerSingleton<NetworkInfoImpl>(NetworkInfoImpl(InternetConnectionChecker()));
    getIt.registerSingleton<RemoteDateDatasourseImpl>(RemoteDateDatasourseImpl(getIt.get<ApiService>()));
    getIt.registerSingleton<LocalDateDataSourseImpl>(LocalDateDataSourseImpl());
    getIt.registerSingleton<GoalsRepoImpl>(GoalsRepoImpl(getIt.get<ApiService>(),SportNetworkDataImpl(apiService: getIt.get<ApiService>()),SportLocalDataImpl(),getIt.get<NetworkInfoImpl>()
        , getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>()));
    getIt.registerSingleton<PlansRepoImpl>(PlansRepoImpl(getIt.get<ApiService>(),SportNetworkDataImpl(apiService: getIt.get<ApiService>()),SportLocalDataImpl(),getIt.get<NetworkInfoImpl>(), getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>()));
    getIt.registerSingleton<MealRepoImpl>(MealRepoImpl(getIt.get<ApiService>(),MealNetworkDataImpl(apiService: getIt.get<ApiService>()),MealLocalDataImpl(),getIt.get<NetworkInfoImpl>(), getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>()));
    getIt.registerSingleton<ProfileStatisticsImpl>(ProfileStatisticsImpl(getIt.get<ApiService>() ,getIt.get<NetworkInfoImpl>(), getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>(),ProfileNetworkDataImpl( apiService: getIt.get<ApiService>()),ProfileStatisticLocalDataImpl()));
    getIt.registerSingleton<WaterStatisticsImpl>(WaterStatisticsImpl(getIt.get<ApiService>() ,getIt.get<NetworkInfoImpl>(), getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>(),WaterNetworkDataImpl( apiService: getIt.get<ApiService>()),WaterStatisticLocalDataImpl()));
    getIt.registerSingleton<SleepStatisticsImpl>(SleepStatisticsImpl(getIt.get<ApiService>() ,getIt.get<NetworkInfoImpl>(), getIt.get<RemoteDateDatasourseImpl>(),getIt.get<LocalDateDataSourseImpl>(),SleepNetworkDataImpl( apiService: getIt.get<ApiService>()),SleepStatisticLocalDataImpl()));
    // getIt.registerSingleton<LastUpdateDatabaseRepoImpl>(LastUpdateDatabaseRepoImpl(
    //   apiService: getIt.get<ApiService>(), remoteDateDatasourse: getIt.get<RemoteDateDatasourseImpl>(),
    //   localDateDataSourse: getIt.get<LocalDateDataSourseImpl>(), networkInfo:getIt.get<NetworkInfoImpl>(),)
  //  );
  }

firstRun() async {
  bool firstRun = await IsFirstRun.isFirstRun();
 final prefs = await SharedPreferences.getInstance();
  UserCacheHelper cacheHelper = UserCacheHelper();
  getIt.registerSingleton<bool>(firstRun);
   getIt.registerSingleton<SharedPreferences>(prefs );
  getIt.registerSingleton<UserCacheHelper>(cacheHelper);
 // await initApp();
  // if(getIt.get<SharedPreferences>().getString('user') != null )
  //   {
  //     RegisterModel? user = await getIt.get<UserCacheHelper>().getUserCache('user');
  //     getIt.registerSingleton<RegisterModel>(user);
  //   }

}
// Future<void> initApp() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   ///region ScreenUtil
//   await ScreenUtil.ensureScreenSize();
//   //endregion
// }
