import 'package:dartz/dartz.dart';
import 'package:fitness/features/workout_tracker/data/models/goales_model.dart';
import 'package:fitness/features/workout_tracker/data/models/user_status_model.dart';
import '../../../../common/errors/failures.dart';
import '../models/AddGoalMoreDay.dart';

abstract class GoalsRepo{
  Future<Either<Failure, Goales>> fetchGoals ();
  Either<Failure, Goales> fetchGoalsFromCashe ();
  Future<Either<Failure, AddGoalMoreDay>> addday();
  Future<Either<Failure, AddGoalMoreDay>> noAddday();
  Future<Either<Failure, UserStautsModel>>getUserStatus();
}