import 'package:flutter/cupertino.dart';

import '../domain/api_client_exception.dart';
import '../domain/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final _authService = AuthService();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;
  bool get canStartAuth => !_isAuthProgress;


  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isValid(String login, String password) =>
      login.isNotEmpty && password.isNotEmpty;

  Future<String?> loginApp(String login, String password) async {
    try {
      await _authService.login(login, password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return 'Сервер не доступен. Проверте подключение к интернету';
        case ApiClientExceptionType.auth:
          return 'Неправильный логин пароль!';
        case ApiClientExceptionType.sessionExpired:
        case ApiClientExceptionType.other:
          return 'Произошла ошибка. Попробуйте еще раз';
      }
    } catch (e) {
      return 'Неизвестная ошибка, поторите попытку';
    }
    return null;
  }


  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (!_isValid(login, password)) {
      _updateState('Заполните логин и пароль', false);
      return;
    }
    _updateState(null, true);

    _errorMessage = await loginApp(login, password);
    if (_errorMessage == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('example', (route) => false);
      // MainNavigation.resetNavigation(context);
    } else {
      _updateState(_errorMessage, false);
    }
  }

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
      return;
    }
    _errorMessage = errorMessage;
    _isAuthProgress = isAuthProgress;
    notifyListeners();
  }
}
