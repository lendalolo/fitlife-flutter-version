
import 'package:fitness/common/common%20blocs/languge%20blocs/languge_bloc.dart';
import 'package:fitness/features/workout_tracker/data/models/AddGoalMoreDay.dart';
import 'package:fitness/features/workout_tracker/data/models/Exercies_submit.dart';
import 'package:fitness/features/workout_tracker/data/models/regester_in_goal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../../common/api_servieses.dart';
import '../../../../../common/servies_locator.dart';
import '../../models/exercies_detailes_models.dart';
import '../../models/exercieses_model.dart';
import '../../models/goales_model.dart';
import '../../models/plans_model.dart';
import '../../models/plans_statestics.dart';
import '../../models/today_target_model.dart';
import '../../models/user_status_model.dart';

abstract class SportNetworkData{
  Future<Goales> fetchRemoteGoals();
  Future<plans> fetchRemotePlans(int goalNum);
  Future<Exercieses> fetchRemoteExercies(int planNum);
  Future<ExerciesDetailes> fetchRemoteExerciesDetailes(int exerciesId);
  Future<exerciesSubmit> submitRemoteExercies(int check,int planId,int calories);
  Future<RegisterInGoal>submitGoal(int goalId);
  Future<TodayTargetModel> fetchTodayTarget();
  Future<PlansStatesitics> FetchPlaneStatistics(int planId);
  Future<AddGoalMoreDay> addday();
  Future<AddGoalMoreDay> noAddday();
  Future<UserStautsModel> getUserStatus();
}
class SportNetworkDataImpl extends SportNetworkData{
  final ApiService apiService;
  SportNetworkDataImpl({ required this.apiService});

  @override
  Future<Exercieses> fetchRemoteExercies(int planNum ) async {
    Map<String,dynamic> data = await apiService.post(
      endPoint: 'plan/$planNum/exercises?lang=${getIt.get<SharedPreferences>().getString('lang')}',
       token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
        query: {}
        //'type':'monthly','number_week':'$weakNum'
    );
  //  print(getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token);
    Exercieses ExcerciesList;
    ExcerciesList = Exercieses.fromJson(data);
   // print(ExcerciesList.isChecked);
    return ExcerciesList;
  }

  @override
  Future<Goales> fetchRemoteGoals() async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'goal/index?lang=${getIt.get<SharedPreferences>().getString('lang')}',
    );
    Goales goales =Goales.fromJson(data);
    return goales;
  }

  @override
  Future<plans> fetchRemotePlans(int goalNum) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'plan/plansForGoal/$goalNum?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<SharedPreferences>().getString('user') == null ?'':
        getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!
    );
  //  print(getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!);
    //getIt.get<UserCacheHelper>().getUserCache('user').authorisation?.token.toString()
    plans plansList;
    plansList = plans.fromJson(data);
 //   plansList.dateList!.map((e) => print(e)).toString();
    return plansList;
  }

  @override
  Future<ExerciesDetailes> fetchRemoteExerciesDetailes(int exerciesId) async {
    Map<String,dynamic> data = await apiService.get(
        endPoint: 'exercise/$exerciesId/show?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??''
    );
    // print(getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token);
    ExerciesDetailes ExcerciesDetailes = ExerciesDetailes.fromJson(data);
    return ExcerciesDetailes;
  }

  @override
  Future<exerciesSubmit> submitRemoteExercies(int check, int planId, int calories) async {
    Map<String,dynamic> data = await apiService.post(
        endPoint: 'target/storeExersice?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
        query: {'calories':calories,'plan_id':planId,'check':check}
    );

    exerciesSubmit ExcerciesSubmit = exerciesSubmit.fromJson(data);
  //  print(ExcerciesSubmit.data!.id);
    return ExcerciesSubmit;
  }

  @override
  Future<RegisterInGoal> submitGoal(int goalId) async {
    Map<String,dynamic> data = await apiService.get(
        endPoint: 'target/insert/${goalId}?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<SharedPreferences>().getString('user') == null ?'':
        getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
    );

    RegisterInGoal ExcerciesSubmit = RegisterInGoal.fromJson(data);
    return ExcerciesSubmit;
  }

  @override
  Future<PlansStatesitics> FetchPlaneStatistics(int planId) async {
    Map<String,dynamic> data = await apiService.post(
      endPoint: 'plan/$planId/show?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<SharedPreferences>().getString('user') == null ?'':
      getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
    );

    PlansStatesitics plansStatesitics = PlansStatesitics.fromJson(data);
    return plansStatesitics;
  }

  @override
  Future<TodayTargetModel> fetchTodayTarget() async {
    Map<String,dynamic> data = await apiService.get(
      endPoint: 'target/progress?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      //'target/progress?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<SharedPreferences>().getString('user') == null ?'':
      getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token!,
    );
print(data);
    TodayTargetModel todayTargetModel = TodayTargetModel.fromJson(data);
    return todayTargetModel;
  }

  @override
  Future<AddGoalMoreDay> addday() async {
    Map<String,dynamic> data = await apiService.get(
        endPoint: 'target/addDay?lang=${getIt.get<SharedPreferences>().getString('lang')}',
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
    );
    AddGoalMoreDay excerciesSubmit = AddGoalMoreDay.fromJson(data);
    return excerciesSubmit;
  }

  @override
  Future<AddGoalMoreDay> noAddday() async {
    Map<String,dynamic> data = await apiService.get(
      endPoint: 'target/notAddDay?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
    );
    AddGoalMoreDay excerciesSubmit = AddGoalMoreDay.fromJson(data);
    return excerciesSubmit;
  }

  @override
  Future<UserStautsModel> getUserStatus() async {
    Map<String,dynamic> data = await apiService.get(
      endPoint: 'user/getStatus?lang=${getIt.get<SharedPreferences>().getString('lang')}',
      token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??'',
    );
    UserStautsModel excerciesSubmit = UserStautsModel.fromJson(data);
    return excerciesSubmit;
  }
}