import 'package:flutter_clean_architecture/core/services/storage_service.dart';
import 'package:flutter_clean_architecture/core/utils/constants.dart';

class CategoryLocalProvider {
  final StorageService _storageService ;
  CategoryLocalProvider(this._storageService) ;

  List<String> read()  => _storageService.prefs.getStringList(Keys.category) ?? [] ;

  Future<bool> write(List<String> value) async => await _storageService.prefs.setStringList(Keys.category, value) ;
}
