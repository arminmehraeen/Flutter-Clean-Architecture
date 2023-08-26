part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodos extends TodoEvent {
  LoadTodos();
}

class LoadTodo extends TodoEvent {
  final int todoNumebr;
  LoadTodo(this.todoNumebr);
}

