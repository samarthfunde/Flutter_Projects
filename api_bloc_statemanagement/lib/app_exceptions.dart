class AppExceptions implements Exception {
  String title;
  String msg;

  AppExceptions({required this.title, required this.msg});

  // This is the function to return the error message
  String toErrorMsg() {
    return "$title: $msg";
  }
}

// Subclass for network error exceptions
class FetchDataException extends AppExceptions {
  FetchDataException({required String errorMsg})
      : super(title: "Network Error", msg: errorMsg);
}

// Subclass for invalid request exceptions
class BadRequestException extends AppExceptions {
  BadRequestException({required String errorMsg})
      : super(title: "Invalid Request", msg: errorMsg);
}

// Subclass for unauthorized access exceptions
class UnauthorizedException extends AppExceptions {
  UnauthorizedException({required String errorMsg})
      : super(title: "Unauthorized Error", msg: errorMsg);
}

// Subclass for invalid input exceptions
class InvalidInputException extends AppExceptions {
  InvalidInputException({required String errorMsg})
      : super(title: "Invalid Input", msg: errorMsg);
}
