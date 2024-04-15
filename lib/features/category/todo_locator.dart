import 'package:flutter_clean_architecture/features/category/data/data_source/category_local_provider.dart';
import 'package:flutter_clean_architecture/features/category/domain/entities/category_entity.dart';
import 'package:flutter_clean_architecture/features/category/domain/use_cases/todo_usecase.dart';
import 'package:flutter_clean_architecture/features/category/presentation/bloc/category_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repository/category_repositoryimpl.dart';
import 'domain/repository/category_repository.dart';


class CategoryLocator {

  CategoryLocator(GetIt locator) {

    locator.registerSingleton<CategoryLocalProvider>(CategoryLocalProvider(locator()));

    locator.registerSingleton<CategoryRepository<CategoryEntity>>(CategoryRepositoryImpl<CategoryEntity>(locator()));
    locator.registerSingleton<CategoryUseCase<CategoryEntity>>(CategoryUseCase<CategoryEntity>(locator()));

    locator.registerSingleton<CategoryBloc>(CategoryBloc(locator()));
  }

}
