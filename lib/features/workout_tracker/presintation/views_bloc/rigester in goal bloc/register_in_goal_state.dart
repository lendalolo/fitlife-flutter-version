part of 'register_in_goal_bloc.dart';

 class RegisterInGoalState {}
class RegisterInGoalInitial extends RegisterInGoalState {
}
class GoalesSubmitLoading extends RegisterInGoalState {
}

class GoalesSubmitSuccess extends RegisterInGoalState {
  final RegisterInGoal exerciesData;
  GoalesSubmitSuccess(this.exerciesData);
}
class GoalesSubmitFailed extends RegisterInGoalState {
  final String errorMessage;
  GoalesSubmitFailed(this.errorMessage);
}