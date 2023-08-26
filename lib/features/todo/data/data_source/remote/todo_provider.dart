import 'package:dio/dio.dart';
import '../../../../../core/exception/check_exception.dart';

class TodoProvider {

  final Dio dio ;
  TodoProvider(this.dio) ;

  todosRequest() async {
    try {
      return await dio.get("https://jsonplaceholder.typicode.com/todos/");
    } on DioError catch (e) {
      return CheckExceptions.response(e.response);
    }
  }

  todoRequest(int todoNumber) async {
    try {
      return await dio.get("https://jsonplaceholder.typicode.com/todos/$todoNumber");
    } on DioError catch (e) {
      return CheckExceptions.response(e.response);
    }
  }


}
