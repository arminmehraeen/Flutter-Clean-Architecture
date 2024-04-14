import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/services/snackbar_service.dart';
import 'package:flutter_clean_architecture/core/utils/extension.dart';
import 'package:flutter_clean_architecture/core/widgets/form/custom_text_form_field.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/action_status.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

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
  bool isCreated = true ;

  @override
  void initState() {
    isCreated = widget.todoEntity == null ;
    if(isCreated) {
      titleController = TextEditingController() ;
      descriptionController = TextEditingController() ;
    }else{
      titleController = TextEditingController(text: widget.todoEntity!.title) ;
      descriptionController = TextEditingController(text: widget.todoEntity!.description) ;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: ListTile(
                title: Text( isCreated ? "کار جدید" : "ویرایش کار" ,style: TextStyle(color: Theme.of(context).cardColor),),
                subtitle: Text(DateTime.now().toPersianDateStr(),style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).cardColor),),
              ))
            ],
          )
      ),
      body: BlocConsumer<TodoBloc,TodoState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(controller: titleController, label: "عنوان",),
                  15.height,
                  CustomTextFormField(
                      controller: descriptionController, label: "توضیحات", maxLine: 8),
                  15.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<TodoBloc>().add(
                              isCreated ?
                              InsertTodo(title: titleController.text,description: descriptionController.text) :
                              UpdateTodo(title: titleController.text,description: descriptionController.text,todoEntity: widget.todoEntity!)

                          ) ;
                        }
                      }, child: const Text("ثبت")) ,
                      if(!isCreated) ...[
                        5.width,
                        ElevatedButton(onPressed: () {
                          context.read<TodoBloc>().add(DeleteTodo(todoEntity: widget.todoEntity!)) ;
                        }, child: const Text("حذف"))
                      ]
                    ],
                  )
                ],
              )),
        );
      }, listener: (context, state) {
          if(state.insert is SuccessState || state.delete is SuccessState || state.update is SuccessState) {

            Navigator.pop(context) ;

            if(state.insert is SuccessState) {
              SuccessSnackBar(message: (state.insert as SuccessState).data, context: context);
            }

            if(state.delete is SuccessState) {
              SuccessSnackBar(message: (state.delete as SuccessState).data, context: context);
            }

            if(state.update is SuccessState) {
              SuccessSnackBar(message: (state.update as SuccessState).data, context: context);
            }



            context.read<TodoBloc>().add(LoadTodos()) ;
          }

          if(state.insert is ErrorState || state.delete is ErrorState || state.update is ErrorState) {

            if(state.insert is ErrorState) {
              ErrorSnackBar(message: (state.insert as ErrorState).message, context: context);
            }

            if(state.delete is ErrorState) {
              ErrorSnackBar(message: (state.delete as ErrorState).message, context: context);
            }

            if(state.update is ErrorState) {
              ErrorSnackBar(message: (state.update as ErrorState).message, context: context);
            }
          }
      },)
    );
  }
}
