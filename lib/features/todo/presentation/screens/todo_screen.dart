import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/config/app_theme.dart';
import 'package:flutter_clean_architecture/core/bloc/theme/theme_cubit.dart';
import 'package:flutter_clean_architecture/core/utils/app_helper.dart';
import 'package:flutter_clean_architecture/core/widgets/app_drawer.dart';
import 'package:flutter_clean_architecture/core/widgets/empty_widget.dart';
import 'package:flutter_clean_architecture/core/widgets/error_widget.dart';
import 'package:flutter_clean_architecture/features/category/presentation/screens/category_screen.dart';
import 'package:flutter_clean_architecture/features/setting/presentation/screens/setting_screen.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/widgets/todo_item_widget.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/model/action_status.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  void onAddButton({TodoEntity? todoEntity}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddTodoScreen(
                  todoEntity: todoEntity,
                )));
  }

  @override
  void initState() {
    context.read<TodoBloc>().add(LoadTodos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(actions: [
            IconButton(
                onPressed: onAddButton,
                icon: const Icon(Icons.add_circle_outline))
          ] ,label:"لیست کارها"),
      drawer: const AppDrawer(),
      body: BlocConsumer<TodoBloc, TodoState>(
        builder: (context, state) {
          ActionStatus status = state.load;
          if (status is WaitState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (status is ErrorState) {
            return ErrorMessageWidget(
              onRefreshButton: () {
                context.read<TodoBloc>().add(LoadTodos());
              },
            );
          }

          if (status is SuccessState) {
            List<TodoEntity> data = status.data;

            if (data.isEmpty) {
              return EmptyWidget(
                  message: "لیست کارهای شما خالی است",
                  onAddButton: onAddButton);
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  TodoEntity todoEntity = data[index];
                  return TodoItemWidget(todoEntity: todoEntity, onTap: () => onAddButton(todoEntity: todoEntity)) ;
                },
              ),
            );
          }

          return Container();
        },
        listener: (context, state) {
          if (state.update is SuccessState) {
            context.read<TodoBloc>().add(LoadTodos());
          }
        },
      ),
    );
  }
}
