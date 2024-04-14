import 'package:dio/dio.dart';

import '../exception/check_exception.dart';

class ApiService {

  final Dio dio ;
  ApiService(this.dio);

  get({required String url}) async {
    try {
      return await dio.get(url);
    } on DioError catch (e) {
      return CheckExceptions.response(e.response);
    }
  }
}