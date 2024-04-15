import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/bloc/theme/theme_cubit.dart';
import 'package:flutter_clean_architecture/features/category/domain/entities/category_entity.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.categoryEntity, required this.onTap});
  final CategoryEntity categoryEntity ;
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: context.read<ThemeCubit>().state.themeMode == ThemeMode.dark ? Colors.white : Theme.of(context).primaryColor,
          ),
          child: ListTile(
            trailing: Icon(Icons.arrow_back_ios_new,
                size: 10, color: Theme.of(context).cardColor),
            leading: Icon(Icons.circle,
                color: Theme.of(context).cardColor,
                size: 12),
            title: Text(categoryEntity.title,
                style: TextStyle(
                    color: Theme.of(context).cardColor)),
            subtitle: Text(
                DateTime.parse(categoryEntity.id).toPersianDateStr(),
                style: TextStyle(
                    color: Theme.of(context).cardColor)),
          ),
        ));
  }
}
