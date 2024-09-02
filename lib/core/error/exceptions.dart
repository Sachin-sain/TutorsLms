class ServerException implements Exception {
  String? message;
  ServerException(this.message);
  @override
  String toString() {
    return message.toString();
  }
}

abstract class ApiException implements Exception {
  String message = '';
  ExceptionType type = ExceptionType.custom;
}


class LogoutException implements ApiException {
  @override
  String message;
  @override
  ExceptionType type = ExceptionType.logout;

  LogoutException(this.message);

  @override
  String toString() {
    return message.toString();
  }
}

class CustomMessageException implements ApiException {
  @override
  String message;
  @override
  ExceptionType type = ExceptionType.custom;

  CustomMessageException(this.message);

  @override
  String toString() {
    return message.toString();
  }
}

class ApiFailedException implements ApiException {
  @override
  String message;
  @override
  ExceptionType type = ExceptionType.apiFailed;

  ApiFailedException(this.message);

  @override
  String toString() {
    return message.toString();
  }
}

class DioException implements ApiException {
  @override
  String message;
  @override
  ExceptionType type = ExceptionType.dio;

  DioException(this.message);

  @override
  String toString() {
    return message.toString();
  }
}

enum ExceptionType { apiFailed, connection, logout, custom, server, dio}