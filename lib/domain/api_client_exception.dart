enum ApiClientExceptionType { network,  other, auth, sessionExpired }
enum ApiClientExceptionRegType {network, phone,  repeat, other}

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClientExceptionReg implements Exception{
  final ApiClientExceptionRegType type;

  ApiClientExceptionReg(this.type);
}
