import 'package:dio/dio.dart';

import '../resources/data_state.dart';
import 'app_exception.dart';

class CheckExceptions {
  static dynamic response(Response? response) {
    switch (response?.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response: response);
      case 401:
        throw UnauthorisedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            message: "${response?.statusCode}fetch exception");
    }
  }

  static dynamic getError(AppException exception) =>
      DataFailed(error: exception.message);
}
