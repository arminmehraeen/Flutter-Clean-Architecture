import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';

import '../../domain/entities/todo_entity.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    context.read<TodoBloc>().add(LoadTodos()) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            context.read<TodoBloc>().add(LoadTodos()) ;
          }, icon: const Icon(Icons.refresh))
        ],
        title: const Text("Todos"),
      ),
      body: BlocConsumer<TodoBloc,TodoState>(builder: (context, state) {

        TodosStatus status = state.todosStatus ;

        if(status is TodosLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if(status is TodosCompleted) {
          return ListView.builder(
            itemCount: status.todos.length,
            itemBuilder: (context, index) {
              TodoEntity todoEntity = status.todos[index];
            return ListTile(
              leading: Text(todoEntity.id.toString()),
              title: Text(todoEntity.title),
              subtitle: Text(todoEntity.userId.toString()),
            );
          },);
        }

        if(status is TodosError) {
          return Center(child: Text(status.message),);
        }

        return Container() ;

      }, listener: (context, state) {

      },),
    );
  }
}
