import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/bloc/theme/theme_cubit.dart';
import 'package:flutter_clean_architecture/core/services/api_service.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/storage_service.dart';
import '../features/todo/todo_locator.dart';

GetIt locator = GetIt.instance;

setup() async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<StorageService>(StorageService(sharedPreferences));

  locator.registerSingleton<ThemeCubit>(ThemeCubit(storageService: locator()));

  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<ApiService>(ApiService(locator()));

  TodoLocator(locator) ;

}
