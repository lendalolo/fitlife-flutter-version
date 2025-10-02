part of 'plans_bloc.dart';

class PlansState {
}
class PlansInitial extends PlansState {}
class PlansSuccess extends PlansState {
  final plans plan;
  PlansSuccess(this.plan);
}
class PlansFailed extends PlansState {
  final dynamic obj;
  final String errorMessage;
  PlansFailed(this.errorMessage, this.obj);
}
class PlansLoading extends PlansState {}
class ExerciesSuccess extends PlansState {
  final Exercieses plan;

  ExerciesSuccess(this.plan);
}
class ExerciesInitial extends PlansState {}

class ExerciesFailed extends PlansState {
  final dynamic obj;
  final String errorMessage;
  ExerciesFailed(this.errorMessage, this.obj);
}
class ExerciesLoading extends PlansState {
}

class ExerciesSubmitSuccess extends PlansState {
  final exerciesSubmit exerciesData;
  ExerciesSubmitSuccess(this.exerciesData);
}
class ExerciesSubmitFailed extends PlansState {
  final String errorMessage;
  ExerciesSubmitFailed(this.errorMessage);
}
class ExerciesSubmitLoading extends PlansState {
}
class PlansStatisticsSuccess extends PlansState {
  final PlansStatesitics plansStatesitics;
  PlansStatisticsSuccess(this.plansStatesitics);
}
class PlansStatisticsFailed extends PlansState {
  final dynamic obj;
  final String errorMessage;
  PlansStatisticsFailed(this.errorMessage, this.obj);
}
class PlansStatisticsLoading extends PlansState {}
class   TodayTargetSuccess extends PlansState {
  final TodayTargetModel targetModel;
  TodayTargetSuccess(this.targetModel);
}
class TodayTargetFailed extends PlansState {
  final dynamic obj;
  final String errorMessage;
  TodayTargetFailed(this.errorMessage, this.obj);
}
class TodayTargetLoading extends PlansState {}

