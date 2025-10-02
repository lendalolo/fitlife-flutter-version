import 'package:bloc/bloc.dart';
import 'package:fitness/features/sleep_tracker/data/model/StoreSleepModel.dart';


import '../../data/model/sleep statistics.dart';
import '../../data/repo/sleep_repo.dart';

part 'sleep_event.dart';
part 'sleep_state.dart';

class SleepBloc extends Bloc<SleepEvent, SleepState> {
  final SleepStatisticsRepo sleepRepo;
  SleepBloc(this.sleepRepo) : super(SleepInitial()) {
    on<SleepStaticticsEvent>((event, emit) async {
      emit(SleepLoading());
      var result =await sleepRepo.fetchSleepStatistics();
      result.fold((failed) =>emit(SleepFailed(failed.errMassage,failed.obj)) ,
            (sleepData) => emit(SleepStatisticsSuccess(sleepData)),);
    });
    on<SleepStoreEvent>((event, emit) async {
      emit(SleepLoading());
      var result =await sleepRepo.storeSleep(event.h);
      result.fold((failed) =>emit(SleepFailed(failed.errMassage,failed.obj)) ,
            (sleepData) => emit(SleepStoreSuccess(sleepData)),);
    });
  }
}
