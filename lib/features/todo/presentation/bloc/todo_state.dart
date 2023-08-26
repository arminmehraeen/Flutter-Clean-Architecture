part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final TodosStatus todosStatus;
  final TodoStatus todoStatus;

  const TodoState({
    required this.todosStatus,
    required this.todoStatus,
  });

  TodoState copyWith({TodosStatus? todosStatus,TodoStatus? todoStatus}) {
    return TodoState(
        todosStatus: todosStatus ?? this.todosStatus,
        todoStatus: todoStatus ?? this.todoStatus,
    );
  }

  @override
  List<Object?> get props => [todosStatus,todoStatus];
}
