import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/services/snackbar_service.dart';
import 'package:flutter_clean_architecture/core/utils/extension.dart';
import 'package:flutter_clean_architecture/core/widgets/custom_app_bar.dart';
import 'package:flutter_clean_architecture/core/widgets/form/custom_text_form_field.dart';
import 'package:flutter_clean_architecture/features/category/domain/entities/category_entity.dart';
import 'package:flutter_clean_architecture/features/category/presentation/bloc/category_bloc.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/model/action_status.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key, this.categoryEntity});

  final CategoryEntity? categoryEntity;

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  bool isCreated = true;

  @override
  void initState() {
    isCreated = widget.categoryEntity == null;
    if (isCreated) {
      titleController = TextEditingController();
    } else {
      titleController = TextEditingController(text: widget.categoryEntity!.title);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        CustomAppBar(label: isCreated ? "دسته بندی جدید" : "ویرایش دسته بندی",),
        body: BlocConsumer<CategoryBloc, CategoryState>(
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
                              "${"تاریخ ایجاد"} : ${DateTime.parse(widget.categoryEntity!.id).toPersianDateStr()}"),
                        ),
                        15.height,
                      ],
                      CustomTextFormField(
                        controller: titleController,
                        label: "عنوان",
                      ),
                      15.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<CategoryBloc>().add(
                                    isCreated
                                    ? InsertCategory(
                                        title: titleController.text)
                                    : UpdateCategory(
                                        title: titleController.text,
                                        categoryEntity: widget.categoryEntity!));
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
                              onPressed: () => context.read<CategoryBloc>().add(DeleteCategory(categoryEntity: widget.categoryEntity!)),
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

              context.read<CategoryBloc>().add(LoadCategory());
            }

            if (state.insert is ErrorState ||
                state.delete is ErrorState ||
                state.update is ErrorState) {

              if (state.insert is ErrorState) {
                ErrorSnackBar(
                    message: (state.insert as ErrorState).message,
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
