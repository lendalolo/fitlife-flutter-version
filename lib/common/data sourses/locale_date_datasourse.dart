import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../errors/exiptions.dart';
import '../models/date_model.dart';
import '../servies_locator.dart';
import '../utls/consts.dart';

abstract class LocalDateDataSourse{
  LastTImeDataBaseUbdate? fetchLastTimeUpdated(String name);
  Future<Unit>cashLastTimeUpdated(LastTImeDataBaseUbdate lastdate,String name);
}
class LocalDateDataSourseImpl extends LocalDateDataSourse{
  @override
  Future<Unit> cashLastTimeUpdated(LastTImeDataBaseUbdate lastdate,String name) {
    getIt.get<SharedPreferences>().setString('$DateName$name' , json.encode(lastdate));
    return Future.value(unit);
  }

  @override
  LastTImeDataBaseUbdate? fetchLastTimeUpdated(String name) {
    final date =getIt.get<SharedPreferences>().getString('$DateName$name');
    if( date!= null)
    {
      dynamic datedecode = json.decode(date);
      LastTImeDataBaseUbdate result = LastTImeDataBaseUbdate.fromJson(datedecode);
      return result;
    }
    else{
     return null;
    }
  }
}