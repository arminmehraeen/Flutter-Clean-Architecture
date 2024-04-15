part of 'category_bloc.dart';

class CategoryState {

  final ActionStatus load ;
  final ActionStatus insert ;
  final ActionStatus update ;
  final ActionStatus delete ;

  const CategoryState({
    required this.load,
    required this.insert,
    required this.update,
    required this.delete,
  });

  static CategoryState init() => CategoryState(load: WaitState(), insert: WaitState(), update: WaitState(), delete: WaitState()) ;

  CategoryState copyWith({
    ActionStatus? load,
    ActionStatus? insert,
    ActionStatus? update,
    ActionStatus? delete,
  }) {
    return CategoryState(
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
