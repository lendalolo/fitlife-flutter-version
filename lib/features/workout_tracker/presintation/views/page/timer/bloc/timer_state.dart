// abstract class TimerState {}

// class TimerInitial extends TimerState {}

// class TimerRunning extends TimerState {
//   final int remaining;
//   TimerRunning(this.remaining);
// }

// class TimerPaused extends TimerState {
//   final int remaining;
//   TimerPaused(this.remaining);
// }

// class TimerFinished extends TimerState {}

// abstract class TimerState {}

// class TimerInitial extends TimerState {}

// class TimerRunning extends TimerState {
//   final int remaining;
//   TimerRunning(this.remaining);
// }

// class TimerPaused extends TimerState {
//   final int remaining;
//   TimerPaused(this.remaining);
// }

// class TimerFinished extends TimerState {}

part of 'timer_bloc.dart';
abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerRunning extends TimerState {
  final int remaining;
  TimerRunning(this.remaining);
}

class TimerPaused extends TimerState {
  final int remaining;
  TimerPaused(this.remaining);
}

class TimerFinished extends TimerState {}
