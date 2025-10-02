
import 'package:shared_preferences/shared_preferences.dart';
class LangugeCachHelper {

  LangugeCachHelper();
  Future<void> cacheLangugeCode (String langugeCode) async
  {final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
     sharedPreferences.setString('lang',langugeCode);
  }
  Future<String?> getLangegeCode () async {
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
     return sharedPreferences.getString('lang');
  }
}