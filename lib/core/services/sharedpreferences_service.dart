
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;
  SharedPreferencesService(this.sharedPreferences);

  Future write(String key,dynamic value) async{
    switch(value.runtimeType) {
      case bool :
        sharedPreferences.setBool(key, value);
        break;
      case String :
        sharedPreferences.setString(key, value);
        break;
      case List :
        sharedPreferences.setStringList(key, value);
        break;
      default:
        log("Error data type");
        break;
    }
  }

  Future<Object?> read(String key) async => sharedPreferences.get(key);

}