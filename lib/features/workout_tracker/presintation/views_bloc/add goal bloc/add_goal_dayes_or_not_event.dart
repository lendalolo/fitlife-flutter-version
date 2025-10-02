part of 'add_goal_dayes_or_not_bloc.dart';
 class AddGoalDayesOrNotEvent {}
class AddGoalDayes extends AddGoalDayesOrNotEvent {}
class NoAddGoalDayes extends AddGoalDayesOrNotEvent {}
class GetUserStatusEvent extends AddGoalDayesOrNotEvent {
  int pageNumber;
  GetUserStatusEvent({required this.pageNumber});
}
