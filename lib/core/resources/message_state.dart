abstract class MessageState {
  final bool? flag;
  final String? message;

  const MessageState({required this.flag, required this.message});
}

class SuccessMessage extends MessageState {
  const SuccessMessage({required String message})
      : super(message: message, flag: true);
}

class ErrorMessage extends MessageState {
  const ErrorMessage({required String message})
      : super(message: message, flag: false);
}

class EmptyMessage extends MessageState {
  const EmptyMessage() : super(message: "", flag: false);
}

