class AppException implements Exception {
  final String? _msg;
  final String? _prefix;

  AppException([
    this._msg,
    this._prefix,
  ]);

  @override
  String toString() {
    return "$_prefix$_msg";
  }
}

class FetchDataException extends AppException {
  FetchDataException([msg]) : super(msg, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([msg]) : super(msg, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([msg]) : super(msg, "Unauthorized Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([msg]) : super(msg, "Invalid Input: ");
}
