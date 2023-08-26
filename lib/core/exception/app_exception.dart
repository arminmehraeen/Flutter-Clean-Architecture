import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final Response? response;

  AppException({required this.message, this.response});
}

class ServerException extends AppException {
  ServerException({String? message})
      : super(message: message ?? "server error , please try again.");
}

class NotFoundException extends AppException {
  NotFoundException({String? message})
      : super(message: message ?? "page not found.");
}

class DataParsingException extends AppException {
  DataParsingException({String? message})
      : super(message: message ?? "Data has Corrupted");
}

class BadRequestException extends AppException {
  BadRequestException({String? message, Response? response})
      : super(message: message ?? "bad request exception.", response: response);
}

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super(message: message ?? "please check your connection.");
}

class UnauthorisedException extends AppException {
  UnauthorisedException({String? message})
      : super(message: message ?? "token has been expired.");
}
