import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/domain/use_cases/todo_usecase.dart';

import '../../../../core/resources/data_state.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todos_status.dart';
part 'todo_status.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final TodoUseCase todoUseCase;

  TodoBloc(this.todoUseCase) : super(TodoState(todosStatus: TodosLoading(),todoStatus: TodoLoading())) {

    on<LoadTodos>((event, emit) async {
      emit(state.copyWith(todosStatus: TodosLoading())) ;

      DataState dataState  = await todoUseCase.getTodos() ;
      if(dataState is DataSuccess) {
        emit(state.copyWith(todosStatus: TodosCompleted(todos: dataState.data))) ;
      }

      if(dataState is DataFailed) {
        emit(state.copyWith(todosStatus: TodosError(message: dataState.error!))) ;
      }
    });

    on<LoadTodo>((event, emit) async {
      emit(state.copyWith(todoStatus: TodoLoading())) ;

      DataState dataState  = await todoUseCase.getTodo(event.todoNumebr) ;
      if(dataState is DataSuccess) {
        emit(state.copyWith(todoStatus: TodoCompleted(todos: dataState.data))) ;
      }

      if(dataState is DataFailed) {
        emit(state.copyWith(todoStatus: TodoError(message: dataState.error!))) ;
      }
    });
  }
}
