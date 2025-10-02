part of 'timer_bloc.dart';
abstract class TimerEvent {}

class StartTimer extends TimerEvent {
  final int duration;
  StartTimer(this.duration);
}

class PauseTimer extends TimerEvent {}

class ResumeTimer extends TimerEvent {}

class CompleteTimer extends TimerEvent {}

class UpdateTimer extends TimerEvent {
  final int remaining;
  UpdateTimer(this.remaining);
}

// abstract class TimerEvent {}

// class StartTimer extends TimerEvent {
//   final int duration;
//   StartTimer(this.duration);
// }

// class CompleteTimer extends TimerEvent {}

// class PauseTimer extends TimerEvent {}

// class ResumeTimer extends TimerEvent {}

// class UpdateTimer extends TimerEvent {
//   final int remaining;
//   UpdateTimer(this.remaining);
// }

// abstract class TimerEvent {}

// class StartTimer extends TimerEvent {
//   final int duration;
//   StartTimer(this.duration);
// }

// class PauseTimer extends TimerEvent {}

// class ResumeTimer extends TimerEvent {}

// class CompleteTimer extends TimerEvent {}

// class UpdateTimer extends TimerEvent {
//   final int remaining;
//   UpdateTimer(this.remaining);
// }
