part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class InsertTodo extends TodoEvent {
  final String title ;
  final String description ;
  final String category ;

  InsertTodo({
    required this.title,
    required this.category,
    required this.description,
  });
}

class UpdateTodo extends TodoEvent {

  final String title ;
  final String description ;
  final String category ;
  final TodoEntity todoEntity ;

  UpdateTodo({
    required this.todoEntity,
    required this.title,
    required this.category,
    required this.description,
  });
}

class UpdateStatusTodo extends TodoEvent {

  final TodoEntity todoEntity ;

  UpdateStatusTodo({
    required this.todoEntity,
  });
}

class DeleteTodo extends TodoEvent {

  final TodoEntity todoEntity ;

  DeleteTodo({
    required this.todoEntity,
  });
}



