part of 'water_bloc.dart';

 class WaterEvent {}
class WaterStaticticsEvent extends WaterEvent{}
class WaterStoreEvent extends WaterEvent{
  final double i;
  WaterStoreEvent(this.i);
}
