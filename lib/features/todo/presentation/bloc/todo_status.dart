part of 'todo_bloc.dart';

@immutable
abstract class TodoStatus extends Equatable {}

class TodoLoading extends TodoStatus {
  @override
  List<Object?> get props => [];
}

class TodoCompleted extends TodoStatus {
  final TodoEntity todos;
  TodoCompleted({required this.todos});
  @override
  List<Object?> get props => [todos];
}

class TodoError extends TodoStatus {
  final String message;
  TodoError({required this.message});
  @override
  List<Object?> get props => [message];
}
