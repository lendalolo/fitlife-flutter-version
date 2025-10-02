import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fitness/common/errors/exiptions.dart';
import 'package:fitness/common/servies_locator.dart';
import 'package:fitness/features/workout_tracker/data/models/exercieses_model.dart';
import 'package:fitness/features/workout_tracker/data/models/goales_model.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../common/utls/consts.dart';
import '../../models/exercies_detailes_models.dart';
import '../../models/plans_statestics.dart';
import '../../models/today_target_model.dart';

abstract class SportLocalData{
  Goales fetchGoal();
  plans fetchPlans(int numgoa);
  Exercieses fetchExersices(int plan);
  ExerciesDetailes fetchRemoteExerciesDetailes(int exerciesId);
  TodayTargetModel fetchTodayTarget();
  PlansStatesitics FetchPlaneStatistics(int planId);
  Future<Unit> cacheGoal(Goales goal);
  Future<Unit> cachePlans(plans plane,int numgoal);
  Future<Unit> cacheExersices( Exercieses exercies,int plan);
  Future<Unit> chacheRemoteExerciesDetailes(int exerciesId,ExerciesDetailes exerciesDetailes );
  Future<Unit> cacheTodayTarget(TodayTargetModel targetModel);
  Future<Unit> cachePlaneStatistics(PlansStatesitics plansStatesitics,int planId);
}
class SportLocalDataImpl extends SportLocalData{

  @override
  Future<Unit> cacheGoal(Goales goal) {
   getIt.get<SharedPreferences>().setString(GoalsName , json.encode(goal));
  return Future.value(unit);
  }
  @override
  Future<Unit> cacheExersices(Exercieses exercies,int plan) {
    getIt.get<SharedPreferences>().setString('${ExerciesName}$plan', json.encode(exercies));
    return Future.value(unit);
  }
  @override
  Future<Unit> cachePlans(plans plane ,int numgoal) {
    getIt.get<SharedPreferences>().setString('$PlansName$numgoal', json.encode(plane));
    return Future.value(unit);
  }
  @override
  Exercieses fetchExersices(int plan,) {
    final exerciesList =getIt.get<SharedPreferences>().getString('${ExerciesName}$plan');
   if( exerciesList!= null)
     {
       dynamic exerciesdecode = json.decode(exerciesList);
       Exercieses result = Exercieses.fromJson(exerciesdecode);
       return result;
     }
   else{
throw EmptyCacheException();
   }
  }

  @override
  Goales fetchGoal() {
    final goalsList = getIt.get<SharedPreferences>().getString(GoalsName);
    if( goalsList!= null)
    {
      print(json.decode(goalsList));
      Goales result = Goales.fromJson(json.decode(goalsList));
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

  @override
  plans fetchPlans(int numgoal) {
    final plansList =getIt.get<SharedPreferences>().getString('$PlansName$numgoal');
    if( plansList!= null)
    {
      dynamic plansdecode = json.decode(plansList);
      plans result = plans.fromJson(plansdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> chacheRemoteExerciesDetailes(int exerciesId,ExerciesDetailes exerciesDetailes) {
    getIt.get<SharedPreferences>().setString('${ExerciesDetailsName}$exerciesId', json.encode(exerciesDetailes));
    return Future.value(unit);
  }

  @override
  ExerciesDetailes fetchRemoteExerciesDetailes(int exerciesId) {
    final exerciesList =getIt.get<SharedPreferences>().getString('${ExerciesDetailsName}$exerciesId');
    if( exerciesList!= null)
    {
      dynamic exerciesdecode = json.decode(exerciesList);
      ExerciesDetailes result = ExerciesDetailes.fromJson(exerciesdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

  @override
  PlansStatesitics FetchPlaneStatistics(int planId) {
    final planStatictecs =getIt.get<SharedPreferences>().getString('${PlansStatesiticsName}$planId');
    if( planStatictecs!= null)
    {
      dynamic exerciesdecode = json.decode(planStatictecs);
      PlansStatesitics result = PlansStatesitics.fromJson(exerciesdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cachePlaneStatistics(PlansStatesitics plansStatesitics, int planId) {
    getIt.get<SharedPreferences>().setString('${PlansStatesiticsName}$planId', json.encode(plansStatesitics));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheTodayTarget(TodayTargetModel targetModel) {
    getIt.get<SharedPreferences>().setString(TodayTargetName, json.encode(targetModel));
    return Future.value(unit);
  }

  @override
  TodayTargetModel fetchTodayTarget() {
    final target =getIt.get<SharedPreferences>().getString(TodayTargetName);
    if( target!= null)
    {
      dynamic exerciesdecode = json.decode(target);
      TodayTargetModel result = TodayTargetModel.fromJson(exerciesdecode);
      return result;
    }
    else{
      throw EmptyCacheException();
    }
  }

}