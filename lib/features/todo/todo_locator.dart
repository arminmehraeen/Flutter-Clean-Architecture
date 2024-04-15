import 'package:flutter_clean_architecture/features/todo/data/data_source/todo_local_provider.dart';
import 'package:flutter_clean_architecture/features/todo/data/data_source/todo_remote_provider.dart';
import 'package:flutter_clean_architecture/features/todo/domain/use_cases/todo_usecase.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repository/todo_repositoryimpl.dart';
import 'domain/repository/todo_repository.dart';


class TodoLocator {

  TodoLocator(GetIt locator) {
    locator.registerSingleton<TodoRemoteProvider>(TodoRemoteProvider(locator()));
    locator.registerSingleton<TodoLocalProvider>(TodoLocalProvider(locator()));

    locator.registerSingleton<TodoRepository>(TodoRepositoryImpl(locator(), locator()));
    locator.registerSingleton<TodoUseCase>(TodoUseCase(locator()));

    locator.registerSingleton<TodoBloc>(TodoBloc(locator()));
  }

}
