import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<StartTimer>(_onStartTimer);
    on<PauseTimer>(_onPauseTimer);
    on<ResumeTimer>(_onResumeTimer);
    on<CompleteTimer>(_onCompleteTimer);
    on<UpdateTimer>(_onUpdateTimer);
  }

  Timer? _ticker;
  int _remaining = 0;

  void _onStartTimer(StartTimer event, Emitter<TimerState> emit) {
    _ticker?.cancel(); // نلغي أي Timer قديم
    if (_remaining == 0) _remaining = event.duration;

    emit(TimerRunning(_remaining));

    _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remaining--;
      if (_remaining > 0) {
        add(UpdateTimer(_remaining));
      } else {
        timer.cancel();
        add(CompleteTimer());
      }
    });
  }

  void _onPauseTimer(PauseTimer event, Emitter<TimerState> emit) {
    _ticker?.cancel(); // نوقف Timer فعليًا
    emit(TimerPaused(_remaining));
  }

  void _onResumeTimer(ResumeTimer event, Emitter<TimerState> emit) {
    emit(TimerRunning(_remaining));
    _ticker?.cancel(); // نتأكد ما في Timer شغال

    _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remaining--;
      if (_remaining > 0) {
        add(UpdateTimer(_remaining));
      } else {
        timer.cancel();
        add(CompleteTimer());
      }
    });
  }

  void _onCompleteTimer(CompleteTimer event, Emitter<TimerState> emit) {
    _ticker?.cancel();
    _remaining = 0;
    emit(TimerFinished());
  }

  void _onUpdateTimer(UpdateTimer event, Emitter<TimerState> emit) {
    _remaining = event.remaining;
    emit(TimerRunning(_remaining));
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
