import 'package:bloc/bloc.dart';
import 'package:fitness/common/utls/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ChangedTheme > {
  ThemeBloc() : super(ChangedTheme(theme: appThemeData[AppTheme.light]!)) {
    on<ThemeChanged>((event, emit) {
      emit(ChangedTheme(theme: appThemeData[event.theme]!));
    });
  }
}
