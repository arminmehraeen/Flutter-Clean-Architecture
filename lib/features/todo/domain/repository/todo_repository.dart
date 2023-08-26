import '../../../../core/resources/data_state.dart';
import '../entities/todo_entity.dart';

abstract class TodoRepository {

  Future<DataState<TodoEntity>> getTodo(int todoNumber);

  Future<DataState<List<TodoEntity>>> getTodos();

}
