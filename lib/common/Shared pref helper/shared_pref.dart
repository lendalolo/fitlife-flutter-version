import 'package:fitness/common/servies_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  read(String key){
    final prefs =  getIt.get<SharedPreferences>();
    return json.decode(prefs.getString(key)!);
  }

  save(String key, value) {
    final prefs =  getIt.get<SharedPreferences>();
    prefs.setString(key, json.encode(value));
  }

  remove(String key)  {
    final prefs =  getIt.get<SharedPreferences>();
    prefs.remove(key);
  }
}