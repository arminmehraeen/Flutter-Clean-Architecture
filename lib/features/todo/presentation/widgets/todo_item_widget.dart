import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/bloc/theme/theme_cubit.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../bloc/todo_bloc.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({super.key, required this.todoEntity, required this.onTap});
  final TodoEntity todoEntity ;
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: context.read<ThemeCubit>().state.themeMode == ThemeMode.dark ? Colors.white : Theme.of(context).primaryColor,
          ),
          child: ListTile(
            trailing: Icon(Icons.arrow_back_ios_new,
                size: 10, color: Theme.of(context).cardColor),
            leading: GestureDetector(
              onTap: () => context.read<TodoBloc>().add(
                  UpdateStatusTodo(todoEntity: todoEntity.copyWith(status: !todoEntity.status))),
              child: Icon(Icons.circle,
                  color: todoEntity.status
                      ? Colors.green
                      : Colors.red,
                  size: 12),
            ),
            title: Text(todoEntity.title,
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    decoration: todoEntity.status
                        ? TextDecoration.none
                        : TextDecoration.lineThrough)),
            subtitle: Text(
                DateTime.parse(todoEntity.id).toPersianDateStr(),
                style: TextStyle(
                    color: Theme.of(context).cardColor)),
          ),
        ));
  }
}
