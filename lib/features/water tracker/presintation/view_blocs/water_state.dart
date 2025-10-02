part of 'water_bloc.dart';

class WaterState {}

class WaterInitial extends WaterState {}
class WaterStatisticsSuccess extends WaterState {
  final WaterStatistics water;
  WaterStatisticsSuccess(this.water);
}
class WaterFailed extends WaterState {
  final dynamic obj;
  final String errorMessage;
  WaterFailed(this.errorMessage, this.obj);
}
class WaterLoading extends WaterState {}
class WaterStoreSuccess extends WaterState {
  final StoreWater water;
  WaterStoreSuccess(this.water);
}
