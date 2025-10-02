import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../../common/servies_locator.dart';

part 'opining_app_event.dart';
part 'opining_app_state.dart';

class OpiningAppBloc extends Bloc<OpiningAppEvent, OpiningAppState> {
  OpiningAppBloc() : super(OpiningAppInitial()) {
    on<OpiningAppEvent>((event, emit) async {
      emit(OpiningAppLoading());
      await firstRun();
      emit(OpiningAppSucsses());
    });
  }
}
