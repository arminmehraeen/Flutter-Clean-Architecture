import 'package:flutter_clean_architecture/features/todo/data/data_source/remote/todo_provider.dart';
import 'package:flutter_clean_architecture/features/todo/domain/use_cases/todo_usecase.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repository/todo_repositoryimpl.dart';
import 'domain/repository/todo_repository.dart';


class TodoLocator {

  TodoLocator(GetIt locator) {
    locator.registerSingleton<TodoProvider>(TodoProvider(locator()));

    locator.registerSingleton<TodoRepository>(TodoRepositoryImpl(locator()));
    locator.registerSingleton<TodoUseCase>(TodoUseCase(locator()));

    locator.registerSingleton<TodoBloc>(TodoBloc(locator()));
  }

}
