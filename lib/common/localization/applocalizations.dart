import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AppLocalazations {
  Locale? local;
  late Map<String ,dynamic> jsonStrings;
  dynamic translate (String key) => jsonStrings[key]??'';
  AppLocalazations(this.local);
  static AppLocalazations? of (BuildContext context){
    return Localizations.of<AppLocalazations>(context, AppLocalazations );
  }
  static LocalizationsDelegate<AppLocalazations> delegate = ApplocalizationDelegate();
  Future loadLangJson( )async{
    String strings = await  rootBundle.loadString('assets/lang/${local!.languageCode}.json');
    Map<String ,dynamic> jsons = json.decode(strings);
    jsonStrings =jsons.map((key, value) {
      return MapEntry(key, value);
    });
  }
}
class ApplocalizationDelegate extends LocalizationsDelegate<AppLocalazations>{
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalazations> load(Locale locale)async {
    AppLocalazations appLocalazations =AppLocalazations(locale);
    await appLocalazations.loadLangJson();
    return appLocalazations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalazations> old) => false;

}