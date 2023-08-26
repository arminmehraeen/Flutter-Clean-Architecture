import 'package:dio/dio.dart';

import '../../../../core/exception/app_exception.dart';
import '../../../../core/exception/check_exception.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repository/todo_repository.dart';
import '../data_source/remote/todo_provider.dart';
import '../model/todo_model.dart';


class TodoRepositoryImpl extends TodoRepository {
  final TodoProvider todoProvider;

  TodoRepositoryImpl(this.todoProvider);

  @override
  Future<DataState<TodoEntity>> getTodo(int todoNumber) async {
    try {
      Response response = await todoProvider.todoRequest(todoNumber);
      if (response.statusCode == 200) {
        TodoModel todoModel = TodoModel.fromMap(response.data);
        TodoEntity todoEntity = TodoEntity.fromModel(todoModel);
        return DataSuccess(data: todoEntity);
      } else {
        return const DataFailed(error: "");
      }
    } on AppException catch (e) {
      return await CheckExceptions.getError(e);
    }
  }

  @override
  Future<DataState<List<TodoEntity>>> getTodos() async{
    try {
      Response response = await todoProvider.todosRequest();
      if (response.statusCode == 200) {
        List data = response.data;
        List<TodoModel> todoModelList = data.map((e) => TodoModel.fromMap(e))
            .toList();
        List<TodoEntity> todoEntityList = todoModelList.map((TodoModel e) =>
            TodoEntity.fromModel(e)).toList();
        return DataSuccess(data: todoEntityList);
      } else {
        return const DataFailed(error: "");
      }
    } on AppException catch (e) {
      return await CheckExceptions.getError(e);
    }
  }



}
