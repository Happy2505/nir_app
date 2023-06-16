
import 'network_client.dart';

class AuthApiClient {
  final _networkClient = NetworkClient();

  Future<String> auth({
    required String userName,
    required String password,
  }) async {
    final accessToken = await _validateUser(
      userName: userName,
      password: password,
    );
    return accessToken;
  }

  Future<String> registration({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registration = _registrationUser(
        userName: userName,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
    return registration;
  }

  Future<String> _registrationUser({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    String parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['id'] as String;
      return token;
    }

    final parameters = <String, dynamic>{
      'userName': userName,
      'password': email,
      'emailAddress': password,
      'phoneNumber': confirmPassword,
    };
    final result =
        _networkClient.postReg('api/Registration', parameters, parser);
    return result;
  }

  Future<String> _validateUser({
    required String userName,
    required String password,
  }) async {
    String parser(dynamic json) {
      final jsonMap = json as String;
      final token = jsonMap;
      return token;
    }

    final parameters = <String, dynamic>{
      'userName': userName,
      'password': password,
    };
    final result = _networkClient.post(
      'api/Auth',
      parameters,
      parser,
    );
    return result;
  }
}
