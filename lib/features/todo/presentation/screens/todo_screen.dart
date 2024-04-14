import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/widgets/empty_widget.dart';
import 'package:flutter_clean_architecture/core/widgets/error_widget.dart';
import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/action_status.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_clean_architecture/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  void onAddButton ({TodoEntity? todoEntity}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoScreen(todoEntity: todoEntity,))) ;
  }

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
          IconButton(onPressed: onAddButton, icon: const Icon(Icons.add_circle_outline))
        ],
        toolbarHeight: 60,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.dashboard,color: Theme.of(context).cardColor),
            Flexible(child: ListTile(
              title: Text("کارها",style: TextStyle(color: Theme.of(context).cardColor),),
              subtitle: Text(DateTime.now().toPersianDateStr(),style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).cardColor),),
            ))
          ],
        )
      ),

      body: BlocConsumer<TodoBloc,TodoState>(builder: (context, state) {

        ActionStatus status = state.load ;
        if(status is WaitState) {
          return const Center(
              child: CircularProgressIndicator()
          ) ;
        }

        if(status is ErrorState) {
          return ErrorMessageWidget(onRefreshButton: () {
            context.read<TodoBloc>().add(LoadTodos()) ;
          },);
        }

        if(status is SuccessState) {
          List<TodoEntity> data = status.data ;

          if(data.isEmpty) {

            return EmptyWidget(message: "لیست کارهای شما خالی است", onAddButton: onAddButton) ;

          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                TodoEntity todoEntity = data[index] ;
              return GestureDetector(
                onTap: () => onAddButton(todoEntity: todoEntity),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: ListTile(
                    trailing: Icon(Icons.arrow_back_ios_new,size: 10,color: Theme.of(context).cardColor,),
                    leading: Icon(Icons.circle , color: todoEntity.status ? Colors.green : Colors.red , size: 12,),
                    title: Text(todoEntity.title,style: TextStyle(color: Theme.of(context).cardColor),),
                    subtitle: Text(DateTime.parse(todoEntity.id).toPersianDateStr(),style: TextStyle(color: Theme.of(context).cardColor),),
                  ),
                )
              );
            },),
          ) ;
        }

        return Container() ;

      }, listener: (context, state) {

      },),
    );
  }

}
