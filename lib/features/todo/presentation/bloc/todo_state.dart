part of 'todo_bloc.dart';

class TodoState {

  final ActionStatus load ;
  final ActionStatus insert ;
  final ActionStatus update ;
  final ActionStatus delete ;

  const TodoState({
    required this.load,
    required this.insert,
    required this.update,
    required this.delete,
  });

  static TodoState init() => TodoState(load: WaitState(), insert: WaitState(), update: WaitState(), delete: WaitState()) ;

  TodoState copyWith({
    ActionStatus? load,
    ActionStatus? insert,
    ActionStatus? update,
    ActionStatus? delete,
  }) {
    return TodoState(
      load: load ?? this.load,
      insert: insert ?? this.insert,
      update: update ?? this.update,
      delete: delete ?? this.delete,
    );
  }

  @override
  String toString() {
    return 'TodoState{load: $load, insert: $insert, update: $update, delete: $delete}';
  }
}