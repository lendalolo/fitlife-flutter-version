part of 'theme_bloc.dart';

 class ThemeEvent {}
class ThemeChanged extends ThemeEvent{
   final AppTheme theme ;
   ThemeChanged(this.theme);
}
