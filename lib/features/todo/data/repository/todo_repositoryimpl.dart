import 'dart:convert';
import 'package:flutter_clean_architecture/features/todo/data/data_source/todo_local_provider.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/todo_repository.dart';
import '../data_source/todo_remote_provider.dart';


class TodoRepositoryImpl extends TodoRepository {

  final TodoRemoteProvider remote;
  final TodoLocalProvider   local;

  TodoRepositoryImpl(this.remote,this.local);

  @override
  Future<DataState<List<TodoEntity>>> index() async {
    try {
      List<String> stringTodos = local.read();
      List<TodoEntity> todos = stringTodos.map((e) => TodoEntity.fromMap(json.decode(e))).toList() ;
      return DataSuccess(data:  todos);
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  @override
  Future<DataState<bool>> insert(String title, String description) async {
    try {
      List<String> stringTodos = local.read();
      List<TodoEntity> todos = stringTodos.map((e) => TodoEntity.fromMap(json.decode(e))).toList()..add(TodoEntity(id: DateTime.now().toString(), title: title, description: description, status: false)) ;
      List<String> temp = todos.map((e) => json.encode(e.toMap())).toList();
      return DataSuccess(data: await local.write(temp));
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  @override
  Future<DataState<bool>> update(String title, String description,TodoEntity entity) async {
    try {
      List<String> stringTodos = local.read();
      List<TodoEntity> todos = stringTodos.map((e) => TodoEntity.fromMap(json.decode(e))).toList().map((e) => e.id == entity.id ? e.copyWith(
        description: description,
        title: title
      ) : e).toList() ;
      List<String> temp = todos.map((e) => json.encode(e.toMap())).toList();
      return DataSuccess(data: await local.write(temp));
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  @override
  Future<DataState<bool>> delete(TodoEntity entity) async {
    try {
      List<String> stringTodos = local.read();
      List<TodoEntity> todos = stringTodos.map((e) => TodoEntity.fromMap(json.decode(e))).toList();
      List item = todos.where((element) => element.id != entity.id).toList() ;
      List<String> temp = item.map((e) => json.encode(e.toMap())).toList();
      return DataSuccess(data: await local.write(temp));
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  // @override
  // Future<DataState<TodoEntity>> getBio() async {
  //
  //   try {
  //     Response response = await bioProvider._service();
  //     if (response.statusCode == 200) {
  //       BioEntity bioEntity = BioEntity(message: response.data['name']) ;
  //       return DataSuccess(data: bioEntity);
  //     } else {
  //       return const DataFailed(error: "");
  //     }
  //   } on AppException catch (e) {
  //     return await CheckExceptions.getError(e);
  //   }
  // }

}
