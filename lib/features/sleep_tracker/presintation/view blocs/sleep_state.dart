part of 'sleep_bloc.dart';

class SleepState {}

class SleepInitial extends SleepState {}
class SleepStatisticsSuccess extends SleepState {
  final SleepStatistics sleep;
  SleepStatisticsSuccess(this.sleep);
}
class SleepFailed extends SleepState {
  final dynamic obj;
  final String errorMessage;
  SleepFailed(this.errorMessage, this.obj);
}
class SleepLoading extends SleepState {}
class SleepStoreSuccess extends SleepState {
  final StoreSleepModel sleep;
  SleepStoreSuccess(this.sleep);
}
