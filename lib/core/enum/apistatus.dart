enum ApiState {
  loading,
  success,
  failure;

  bool get isLoading => this == ApiState.loading;

  bool get isSuccess => this == ApiState.success;

  bool get isFailure => this == ApiState.failure;
}
enum AnswerType { yes, no }