import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:flutter_clean_architecture/core/widgets/empty_widget.dart';
import 'package:flutter_clean_architecture/core/widgets/error_widget.dart';
import 'package:flutter_clean_architecture/features/category/presentation/bloc/category_bloc.dart';
import 'package:flutter_clean_architecture/features/category/presentation/screens/add_category_screen.dart';
import 'package:flutter_clean_architecture/features/category/presentation/widgets/category_item_widget.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/model/action_status.dart';
import '../../domain/entities/category_entity.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key,this.isLink = false});
  final bool isLink;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void onAddButton({CategoryEntity? categoryEntity}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddCategoryScreen(
                  categoryEntity: categoryEntity,
                )));
  }

  @override
  void initState() {
    context.read<CategoryBloc>().add(LoadCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          actions: [
            IconButton(
                onPressed: onAddButton,
                icon: const Icon(Icons.add_circle_outline))
          ], label: "دسته بندی ها" ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
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
            List<CategoryEntity> data = status.data;
            if (data.isEmpty) {
              return EmptyWidget(
                  message: "لیست دسته بندی های شما خالی است",
                  onAddButton: onAddButton);
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  CategoryEntity categoryEntity = data[index];
                  return CategoryItemWidget(categoryEntity: categoryEntity, onTap: () => widget.isLink ? Navigator.pop(context,categoryEntity) : onAddButton(categoryEntity: categoryEntity)) ;
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
