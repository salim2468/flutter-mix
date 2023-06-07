class Sucess {
  int code;
  Object response;
  Sucess({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  Failure({required this.code, required this.errorResponse});
}
