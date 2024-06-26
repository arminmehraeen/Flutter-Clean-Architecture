import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/services/snackbar_service.dart';
import 'package:flutter_clean_architecture/core/utils/extension.dart';
import 'package:flutter_clean_architecture/core/widgets/form/custom_text_form_field.dart';
import 'package:flutter_clean_architecture/core/widgets/form/link_form_field.dart';
import 'package:flutter_clean_architecture/features/category/domain/entities/category_entity.dart';
import 'package:flutter_clean_architecture/features/category/presentation/screens/category_screen.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/model/action_status.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, this.todoEntity});

  final TodoEntity? todoEntity;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {

  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController categoryController;
  bool isCreated = true;

  @override
  void initState() {
    isCreated = widget.todoEntity == null;
    if (isCreated) {
      titleController = TextEditingController();
      descriptionController = TextEditingController();
      categoryController = TextEditingController();
    } else {
      titleController = TextEditingController(text: widget.todoEntity!.title);
      descriptionController = TextEditingController(text: widget.todoEntity!.description);
      categoryController = TextEditingController(text: widget.todoEntity!.category);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(label: isCreated ? "کار جدید" : "ویرایش کار",),
        body: BlocConsumer<TodoBloc, TodoState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (!isCreated) ...[
                        ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: Text(
                              "${"تاریخ ایجاد"} : ${DateTime.parse(widget.todoEntity!.id).toPersianDateStr()}"),
                          subtitle: Text(
                              "${"وضعیت"} : ${widget.todoEntity!.status ? "فعال" : "غیرفعال"}"),
                        ),
                        15.height,
                      ],
                      CustomTextFormField(
                        controller: titleController,
                        label: "عنوان",
                      ),
                      15.height,
                      LinkFormField<CategoryEntity>(label: "دسته بندی", screen: const CategoryScreen(isLink: true), onResult: (value) {

                      },controller: categoryController),
                      15.height,
                      CustomTextFormField(
                          controller: descriptionController,
                          label: "توضیحات",
                          maxLine: 8),
                      15.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                                context.read<TodoBloc>().add(isCreated
                                    ? InsertTodo(
                                        category: categoryController.text,
                                        title: titleController.text,
                                        description: descriptionController.text)
                                    : UpdateTodo(
                                        category: categoryController.text,
                                        title: titleController.text,
                                        description: descriptionController.text,
                                        todoEntity: widget.todoEntity!));
                              }
                            },
                            label: const Text("ثبت"),
                            icon: const Icon(Icons.done, size: 16),
                          ),
                          if (!isCreated) ...[
                            5.width,
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent),
                              onPressed: () => context.read<TodoBloc>().add(
                                  DeleteTodo(todoEntity: widget.todoEntity!)),
                              label: const Text("حذف"),
                              icon: const Icon(Icons.delete_outline, size: 16),
                            )
                          ]
                        ],
                      )
                    ],
                  )),
            );
          },
          listener: (context, state) {
            if (state.insert is SuccessState ||
                state.delete is SuccessState ||
                state.update is SuccessState) {
              Navigator.pop(context);

              if (state.insert is SuccessState) {
                SuccessSnackBar(
                    message: (state.insert as SuccessState).data,
                    context: context);
              }

              if (state.delete is SuccessState) {
                SuccessSnackBar(
                    message: (state.delete as SuccessState).data,
                    context: context);
              }

              if (state.update is SuccessState) {
                SuccessSnackBar(
                    message: (state.update as SuccessState).data,
                    context: context);
              }

              context.read<TodoBloc>().add(LoadTodos());
            }

            if (state.insert is ErrorState ||
                state.delete is ErrorState ||
                state.update is ErrorState) {
              if (state.insert is ErrorState) {
                ErrorSnackBar(
                    message: (state.insert as ErrorState).message,
                    context: context);
              }

              if (state.delete is ErrorState) {
                ErrorSnackBar(
                    message: (state.delete as ErrorState).message,
                    context: context);
              }

              if (state.update is ErrorState) {
                ErrorSnackBar(
                    message: (state.update as ErrorState).message,
                    context: context);
              }
            }
          },
        ));
  }
}
