abstract class UseCase<T, P> {
  Future<T> call(P param);
}

abstract class NoParamUseCase<T> {
  Future<T> call();
}

abstract class NoReturnUseCase<P> {
  Future call(P param);
}
