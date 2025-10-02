part of 'goals_bloc.dart';

class GoalsState {}

class GoalsInitial extends GoalsState {}
class GoalsSuccess extends GoalsState {
  final Goales plans;
  GoalsSuccess(this.plans);
}
class GoalsFailed extends GoalsState {
  final dynamic obj;
  final String errorMessage;
  GoalsFailed(this.errorMessage, this.obj);
}
class GoalsLoading extends GoalsState {}
