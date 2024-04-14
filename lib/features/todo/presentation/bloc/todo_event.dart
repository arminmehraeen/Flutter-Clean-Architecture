part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class InsertTodo extends TodoEvent {
  final String title ;
  final String description ;

  InsertTodo({
    required this.title,
    required this.description,
  });
}

class UpdateTodo extends TodoEvent {

  final String title ;
  final String description ;
  final TodoEntity todoEntity ;

  UpdateTodo({
    required this.todoEntity,
    required this.title,
    required this.description,
  });
}

class DeleteTodo extends TodoEvent {

  final TodoEntity todoEntity ;

  DeleteTodo({
    required this.todoEntity,
  });
}

