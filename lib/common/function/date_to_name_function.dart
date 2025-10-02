
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common blocs/languge blocs/languge_bloc.dart';
import '../servies_locator.dart';
String getDayNameFromString(String dateString) {

  DateTime date = DateTime.parse(dateString);

  Intl.defaultLocale =getIt.get<SharedPreferences>().getString('lang');

  return DateFormat('EEEE', getIt.get<SharedPreferences>().getString('lang')).format(date);
}