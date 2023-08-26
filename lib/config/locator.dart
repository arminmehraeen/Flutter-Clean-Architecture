import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/bloc/app/app_cubit.dart';
import 'package:flutter_clean_architecture/features/todo/todo_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/sharedpreferences_service.dart';
import '../core/services/storage_service.dart';

GetIt locator = GetIt.instance;

setup() async {

  locator.registerSingleton<AppCubit>(AppCubit());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerSingleton<Dio>(Dio());

  locator.registerSingleton<StorageService>(StorageService(locator()));
  locator.registerSingleton<SharedPreferencesService>(SharedPreferencesService(locator()));

  TodoLocator(locator);

}
