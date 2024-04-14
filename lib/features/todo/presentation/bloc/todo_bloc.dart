import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/action_status.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final TodoUseCase todoUseCase ;
  TodoBloc(this.todoUseCase) : super(TodoState.init()) {

    on<LoadTodos>((event, emit)  async {
      emit(TodoState.init()) ;

      DataState<List<TodoEntity>> response = await todoUseCase.index() ;

      if(response is DataSuccess) {
        emit(state.copyWith(load: SuccessState<List<TodoEntity>>(data: response.data!))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(load: ErrorState(message: response.error!))) ;
      }

    });

    on<InsertTodo>((event, emit)  async {

      DataState<bool> response = await todoUseCase.insert(event.title,event.description) ;

      if(response is DataSuccess) {
        emit(state.copyWith(insert: SuccessState(data: "کار با موفقیت اضافه شد"))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(insert: ErrorState(message: "مشکل در اضافه کردن کار"))) ;
      }

    });

    on<UpdateTodo>((event, emit)  async {

      DataState<bool> response = await todoUseCase.update(event.title,event.description,event.todoEntity) ;

      if(response is DataSuccess) {
        emit(state.copyWith(update: SuccessState(data: "کار با موفقیت ویرایش شد"))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(update: ErrorState(message: "مشکل در ویرایش کردن کار"))) ;
      }

    });

    on<DeleteTodo>((event, emit)  async {

      DataState<bool> response = await todoUseCase.delete(event.todoEntity) ;

      if(response is DataSuccess) {
        emit(state.copyWith(delete: SuccessState(data: "کار با موفقیت حذف شد"))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(delete: ErrorState(message: "مشکل در حذف کردن کار"))) ;
      }

    });

  }

}
