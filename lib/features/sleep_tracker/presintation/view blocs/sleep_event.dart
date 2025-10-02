part of 'sleep_bloc.dart';

class SleepEvent {}
class SleepStaticticsEvent extends SleepEvent{}
class SleepStoreEvent extends SleepEvent{
  final int h;
  SleepStoreEvent(this.h);
}
