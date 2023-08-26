import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences sharedPreferences;
  StorageService(this.sharedPreferences);

  static const String _introKey = "intro";
  static const String _passwordKey = "password";
  static const String _passwordStatusKey = "passwordStatus";

  Future writePassword(String password) async {
    await sharedPreferences.setString(_passwordKey, password);
  }

  Future removePassword() async {
    await sharedPreferences.remove(_passwordKey);
  }

  Future writePasswordStatus(bool status) async {
    await sharedPreferences.setBool(_passwordStatusKey, status);
  }

  Future<bool> readPasswordStatus() async {
    return sharedPreferences.getBool(_passwordStatusKey) ?? false ;
  }

  Future<String?> readPassword() async {
    return sharedPreferences.getString(_passwordKey);
  }

  Future writeIntro() async {
    await sharedPreferences.setBool(_introKey, false);
  }

  Future<bool> readIntro() async {
    return sharedPreferences.getBool(_introKey) ?? true;
  }
}
