import 'package:dartz/dartz.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_model.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_statestics.dart';

import '../../../../common/errors/failures.dart';
import '../models/Exercies_submit.dart';
import '../models/exercies_detailes_models.dart';
import '../models/exercieses_model.dart';
import '../models/regester_in_goal_model.dart';
import '../models/today_target_model.dart';

abstract class PlansRepo{
  Future<Either<Failure, plans>>fetchPlans (int goalNum);
  Future<Either<Failure, Exercieses>>fetchPlansExercies (int planNum);
  Future<Either<Failure, ExerciesDetailes>> fetchPlansExerciesDetailes(int exerciesId);
  Future<Either<Failure,  exerciesSubmit>> submitExercies(int check, int planId, int calories);
  Future<Either<Failure,  RegisterInGoal>> submitGoal(int goalId);
  Future<Either<Failure,  TodayTargetModel>> fetchTodayTarget();
  Future<Either<Failure,  PlansStatesitics>> FetchPlaneStatistics(int planId);
}