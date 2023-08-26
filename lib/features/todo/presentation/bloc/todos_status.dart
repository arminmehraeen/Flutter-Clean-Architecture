part of 'todo_bloc.dart';

@immutable
abstract class TodosStatus extends Equatable {}

class TodosLoading extends TodosStatus {
  @override
  List<Object?> get props => [];
}

class TodosCompleted extends TodosStatus {
  final List<TodoEntity> todos;
  TodosCompleted({required this.todos});
  @override
  List<Object?> get props => [todos];
}

class TodosError extends TodosStatus {
  final String message;
  TodosError({required this.message});
  @override
  List<Object?> get props => [message];
}
