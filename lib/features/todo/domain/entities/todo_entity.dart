import '../../data/model/todo_model.dart';

class TodoEntity {

  final int id ;
  final int userId ;
  final String title ;
  final bool completed ;

  const TodoEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });


  factory TodoEntity.fromModel(TodoModel model) {
    return TodoEntity(
      id: model.id,
      userId: model.userId,
      title: model.title,
      completed: model.completed,
    );
  }
}
