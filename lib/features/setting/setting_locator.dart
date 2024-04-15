import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

class SettingLocator {

  SettingLocator(GetIt locator) {
    locator.registerSingleton<TodoBloc>(TodoBloc(locator()));
  }

}
