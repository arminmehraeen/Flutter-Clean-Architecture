import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import '../../../../core/resources/data_state.dart';

abstract class TodoRepository {

  Future<DataState<List<TodoEntity>>> index() ;
  Future<DataState<bool>> insert(TodoEntity entity) ;
  Future<DataState<bool>> update(TodoEntity entity) ;
  Future<DataState<bool>> delete(TodoEntity entity) ;

}
