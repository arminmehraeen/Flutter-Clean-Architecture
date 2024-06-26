import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/todo_repository.dart';

class TodoUseCase  {

  final TodoRepository _todoRepository;
  TodoUseCase(this._todoRepository);

  Future<DataState<List<TodoEntity>>> index() async => await _todoRepository.index() ;

  Future<DataState<bool>> insert(TodoEntity entity) async => await _todoRepository.insert(entity) ;

  Future<DataState<bool>> update(TodoEntity entity) async => await _todoRepository.update(entity) ;

  Future<DataState<bool>> delete(TodoEntity entity) async => await _todoRepository.delete(entity) ;

}
