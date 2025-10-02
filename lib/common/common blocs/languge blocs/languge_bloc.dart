import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:fitness/common/Shared%20pref%20helper/languge_cache_helper.dart';
import 'package:fitness/common/servies_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'languge_event.dart';
part 'languge_state.dart';

class LangugeBloc extends Bloc<LangugeEvent, LangugeState> {
  LangugeBloc() : super(LangugeState( window.locale.languageCode == 'ar'? const Locale('ar'): const Locale('en') )) {
    on<setLangugeEvent>((event, emit) async {
       await LangugeCachHelper().cacheLangugeCode(event.lang);
       getIt.get<SharedPreferences>().setString('lang', event.lang);
       emit(LangugeState(Locale(event.lang)));
    });

    on<getLangugeEvent>((event, emit) async {
    var lang = await LangugeCachHelper().getLangegeCode();
    if(lang == null) {
      emit(LangugeState(window.locale.languageCode == 'ar'? const Locale('ar'): const Locale('en')));
    }else{
      emit(LangugeState(Locale(lang)));
     // emit(LangugeState(Locale('en')));
    }
    });
  }
}
