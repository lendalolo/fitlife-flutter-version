import 'package:bloc/bloc.dart';
import 'package:fitness/features/water%20tracker/data/model/StoreWaterModel.dart';
import 'package:fitness/features/water%20tracker/data/model/water_statistics.dart';
import 'package:fitness/features/water%20tracker/data/repo/water_repo.dart';


part 'water_event.dart';
part 'water_state.dart';

class WaterBloc extends Bloc<WaterEvent, WaterState> {
  final WaterStatisticsRepo waterRepo;
  WaterBloc(this.waterRepo) : super(WaterInitial()) {
    on<WaterStaticticsEvent>((event, emit) async {
      emit(WaterLoading());
      var result =await waterRepo.fetchWaterStatistics();
      result.fold((failed) =>emit(WaterFailed(failed.errMassage,failed.obj)) ,
            (waterData) => emit(WaterStatisticsSuccess(waterData)),);
    });
    on<WaterStoreEvent>((event, emit) async {
      emit(WaterLoading());
      var result =await waterRepo.storeWater(event.i);
      result.fold((failed) =>emit(WaterFailed(failed.errMassage,failed.obj)) ,
            (waterData) => emit(WaterStoreSuccess(waterData)),);
    });
  }
}
