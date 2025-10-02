
import 'package:bloc/bloc.dart';
import 'package:fitness/common/servies_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repos/LastUpdateDatabaseRepo.dart';
part 'last_data_base_updated_event.dart';
part 'last_data_base_updated_state.dart';

class LastDataBaseUpdatedBloc extends Bloc<LastDataBaseUpdatedEvent, LastDataBaseUpdatedState> {
  final LastUpdateDatabaseRepo lastUpdateDatabaseRepo;
  LastDataBaseUpdatedBloc(this.lastUpdateDatabaseRepo) : super(LastDataBaseUpdatedInitial()) {

    on<LastDataBaseUpdatedEvent>((event, emit) async {
      emit(LastDataBaseUpdatedLoading());
    var date = await lastUpdateDatabaseRepo.getLastTimeUpdated();
    date.fold((error) => emit(LastDataBaseUpdatedFaield(error.errMassage,error.obj)), (date) {
      if (getIt.get<SharedPreferences>().getString('date') != null &&getIt.get<SharedPreferences>().getString('date') != date)
        {
          emit(LastDataBaseUpdatedhaveToChange());
        }
      else{
        emit(LastDataBaseUpdatedNoNeedToChange());
      }
    });
    });
  }
}
