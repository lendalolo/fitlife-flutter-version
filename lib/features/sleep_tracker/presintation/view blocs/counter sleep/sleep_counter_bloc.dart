import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sleep_counter_event.dart';
part 'sleep_counter_state.dart';

class SleepCounterBloc extends Bloc<SleepCounterEvent, SleepCounterState> {
  SleepCounterBloc() : super(SleepCounterState(0)) {
    int i=0;
    on<SleepCounterEventIncrement>((event, emit) {
      if(i<24)
     i++;
     emit(SleepCounterState(i));
    });
    on<SleepCounterEventDecrement>((event, emit) {
      if(i!=0) {
        i--;
      }
      emit(SleepCounterState(i));
    });
  }
}
