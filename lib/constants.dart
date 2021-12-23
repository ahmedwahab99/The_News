class ErrorCodes{
  static const int NO_CONNECTION_CODE = 1000;
  static const int NO_BODY_PARSING_CODE = 2000;
  static const int NO_RESPONSE_CODE = 3000;
  static const int SERVER_ERRORS_CODE = 4000;
  
}

class Failure{
  final int code;
  final String message;

  Failure(this.code, this.message);

}

class ApiResult {
  late bool hasError;
  dynamic data;
  late Failure failure;
}

