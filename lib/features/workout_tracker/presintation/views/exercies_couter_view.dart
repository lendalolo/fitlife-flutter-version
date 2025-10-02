import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presintation/views/widgets/calories_megerment_widget.dart';

/// Events
abstract class CountdownEvent {}
class StartCountdown extends CountdownEvent {}
class PauseCountdown extends CountdownEvent {}
class ResumeCountdown extends CountdownEvent {}
class Tick extends CountdownEvent {}

/// State
class CountdownState {
  final int secondsRemaining;
  final int totalSeconds; // new field
  final bool isPaused;
  CountdownState({
    required this.secondsRemaining,
    required this.totalSeconds,
    required this.isPaused,
  });
}

/// Bloc
class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  Timer? _timer;
  static const int _initialTime = 40; // 5 minutes = 300 seconds

  CountdownBloc()
      : super(CountdownState(
    secondsRemaining: _initialTime,
    totalSeconds: _initialTime,
    isPaused: false,
  )) {
    on<StartCountdown>(_onStart);
    on<PauseCountdown>(_onPause);
    on<ResumeCountdown>(_onResume);
    on<Tick>(_onTick);
  }

  void _onStart(StartCountdown event, Emitter<CountdownState> emit) {
    _timer?.cancel();
    emit(CountdownState(
      secondsRemaining: _initialTime,
      totalSeconds: _initialTime,
      isPaused: false,
    ));
    _startTimer();
  }

  void _onPause(PauseCountdown event, Emitter<CountdownState> emit) {
    _timer?.cancel();
    emit(CountdownState(
      secondsRemaining: state.secondsRemaining,
      totalSeconds: state.totalSeconds,
      isPaused: true,
    ));
  }

  void _onResume(ResumeCountdown event, Emitter<CountdownState> emit) {
    if (state.isPaused && state.secondsRemaining > 0) {
      emit(CountdownState(
        secondsRemaining: state.secondsRemaining,
        totalSeconds: state.totalSeconds,
        isPaused: false,
      ));
      _startTimer();
    }
  }

  void _onTick(Tick event, Emitter<CountdownState> emit) {
    if (state.secondsRemaining > 0) {
      emit(CountdownState(
        secondsRemaining: state.secondsRemaining - 1,
        totalSeconds: state.totalSeconds,
        isPaused: state.isPaused,
      ));
    } else {
      _timer?.cancel();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(Tick());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

/// ---------- UI ----------
class CountdownPage extends StatelessWidget {
  const CountdownPage({super.key});

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountdownBloc()..add(StartCountdown()),
      child: BlocListener<CountdownBloc, CountdownState>(
        listener: (context, state) {
          if (state.secondsRemaining == 0) {
            Navigator.pop(context); // Go back when finished
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Countdown Timer")),
          body: BlocBuilder<CountdownBloc, CountdownState>(
            builder: (context, state) {
              final timePassed = state.totalSeconds - state.secondsRemaining;
              final  re= 100*timePassed/state.totalSeconds;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/0.4,
                      child: Column(
                        children: [
                          CaloriesMegermentWidget(

                            cal: re.toInt(),
                            text: _formatTime(state.secondsRemaining),
                          ),
                          CaloriesMegermentWidget(
                            cal: re.toInt(), text: _formatTime(state.secondsRemaining),),
                          Text(
                            _formatTime(state.secondsRemaining),
                            style: const TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          if (!state.isPaused)
                            ElevatedButton(
                              onPressed: () {
                                context.read<CountdownBloc>().add(PauseCountdown());
                              },
                              child: const Text("Pause"),
                            )
                          else
                            ElevatedButton(
                              onPressed: () {
                                context.read<CountdownBloc>().add(ResumeCountdown());
                              },
                              child: const Text("Resume"),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/0.1,
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

