import '../../../../core/resources/data_state.dart';
import '../repository/todo_repository.dart';

class TodoUseCase {
  final TodoRepository todoRepository;
  TodoUseCase(this.todoRepository);

  Future<DataState> getTodos() async {
    return await todoRepository.getTodos();
  }

  Future<DataState> getTodo(int todoNumber) async {
    return await todoRepository.getTodo(todoNumber);
  }

}
