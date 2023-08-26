import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen(this.todoNumber, {Key? key}) : super(key: key);
  final int todoNumber ;
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    context.read<TodoBloc>().add(LoadTodo(widget.todoNumber)) ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            context.read<TodoBloc>().add(LoadTodo(widget.todoNumber)) ;
          }, icon: const Icon(Icons.refresh))
        ],
        title: const Text("Todos"),
      ),
      body: BlocConsumer<TodoBloc,TodoState>(builder: (context, state) {

        TodoStatus status = state.todoStatus ;

        if(status is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if(status is TodoCompleted) {
          TodoEntity todoEntity = status.todos;
          return Card(
            child: ListTile(
              leading: Text(todoEntity.id.toString()),
              title: Text(todoEntity.title),
              subtitle: Text(todoEntity.userId.toString()),
            ),
          );
        }

        if(status is TodoError) {
          return Center(child: Text(status.message),);
        }

        return Container() ;

      }, listener: (context, state) {

      },),
    );
  }
}
