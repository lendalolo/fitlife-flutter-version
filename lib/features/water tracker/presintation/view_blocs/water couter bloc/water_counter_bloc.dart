import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'water_counter_event.dart';
part 'water_counter_state.dart';

class WaterCounterBloc extends Bloc<WaterCounterEvent, WaterCounterState> {
  WaterCounterBloc() : super(WaterCounterState(0)) {
    double i=0;
    on<WaterCounterEventIncrement>((event, emit) {
      if(i<30)
      i+=0.5;
      emit(WaterCounterState(i));
    });
    on<WaterCounterEventDecrement>((event, emit) {
      if(i!=0) {
        i-=0.5;
      }
      emit(WaterCounterState(i));
    });
  }
}
