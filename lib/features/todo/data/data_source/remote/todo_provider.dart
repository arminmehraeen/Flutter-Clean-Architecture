import '../../../../../core/services/api_service.dart';

class TodoProvider {

  final ApiService apiService ;
  TodoProvider(this.apiService) ;

  todosRequest() async =>
      await apiService.get(url: "https://jsonplaceholder.typicode.com/todos/");

  todoRequest(int todoNumber) async =>
      await apiService.get(url: "https://jsonplaceholder.typicode.com/todos/$todoNumber");


}
