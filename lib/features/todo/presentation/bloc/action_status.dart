abstract class ActionStatus {}

class WaitState extends ActionStatus {}

class SuccessState<T> extends ActionStatus {
  final T data;

  SuccessState({
    required this.data,
  });
}

class ErrorState extends ActionStatus {
  final String message;

  ErrorState({
    required this.message,
  });
}
