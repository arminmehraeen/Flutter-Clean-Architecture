part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final TodosStatus todosStatus;

  const TodoState({
    required this.todosStatus,
  });

  TodoState copyWith({TodosStatus? todosStatus}) {
    return TodoState(
        todosStatus: todosStatus ?? this.todosStatus,
    );
  }

  @override
  List<Object?> get props => [todosStatus];
}
