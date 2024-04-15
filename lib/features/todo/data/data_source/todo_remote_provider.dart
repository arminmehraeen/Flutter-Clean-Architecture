import '../../../../core/services/api_service.dart';

class TodoRemoteProvider {
  final ApiService apiService;

  TodoRemoteProvider(this.apiService);

  Future nameRequest() async => await apiService.get(url: "https://jsonplaceholder.typicode.com/users/1");
}
