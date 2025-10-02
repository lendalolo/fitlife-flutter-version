part of 'add_goal_dayes_or_not_bloc.dart';
class AddGoalDayesOrNotState {}

 class AddGoalDayesOrNotInitial extends AddGoalDayesOrNotState {}
class AddGoalDayesSuccess extends AddGoalDayesOrNotState {
 final AddGoalMoreDay goalday;
 AddGoalDayesSuccess(this.goalday);
}
class AddGoalDayesFailed extends AddGoalDayesOrNotState {
 final dynamic obj;
 final String errorMessage;
 AddGoalDayesFailed(this.errorMessage, this.obj);
}
class AddGoalDayesLoading extends AddGoalDayesOrNotState {}

class NoAddGoalDayesSuccess extends AddGoalDayesOrNotState {
 final AddGoalMoreDay goalday;
 NoAddGoalDayesSuccess(this.goalday);
}
class NoAddGoalDayesFailed extends AddGoalDayesOrNotState {
 final dynamic obj;
 final String errorMessage;
 NoAddGoalDayesFailed(this.errorMessage, this.obj);
}
class UserStatusGoalLoadingWater extends AddGoalDayesOrNotState {}
class UserStatusGoalLoadingSleep extends AddGoalDayesOrNotState {}
class UserStatusGoalLoadingFood extends AddGoalDayesOrNotState {}

class UserStatusGoalSuccessWater extends AddGoalDayesOrNotState {
 final UserStautsModel goalday;
 UserStatusGoalSuccessWater(this.goalday);
}
class UserStatusGoalSuccessSleep extends AddGoalDayesOrNotState {
 final UserStautsModel goalday;
 UserStatusGoalSuccessSleep(this.goalday);
}
class UserStatusGoalSuccessFood extends AddGoalDayesOrNotState {
 final UserStautsModel goalday;
 UserStatusGoalSuccessFood(this.goalday);
}
class UserStatusGoalFailed extends AddGoalDayesOrNotState {
 final dynamic obj;
 final String errorMessage;
 UserStatusGoalFailed(this.errorMessage, this.obj);
}
