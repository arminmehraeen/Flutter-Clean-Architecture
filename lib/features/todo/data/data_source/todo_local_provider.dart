import 'package:flutter_clean_architecture/core/services/storage_service.dart';
import 'package:flutter_clean_architecture/core/utils/constants.dart';

class TodoLocalProvider {
  final StorageService _storageService ;
  TodoLocalProvider(this._storageService) ;

  List<String> read()  => _storageService.prefs.getStringList(Keys.todos) ?? [] ;

  Future<bool> write(List<String> value) async => await _storageService.prefs.setStringList(Keys.todos, value) ;
}
