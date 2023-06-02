import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session_id';
  static const accountLogin = 'account_login';
  static const accountPassword = 'account_password';
  static const accountCheck = 'account_check';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);

  Future<void> setSessionId(String value) {
    return _secureStorage.write(key: _Keys.sessionId, value: value);
  }

  Future<void> deleteSessionId() {
    return _secureStorage.delete(key: _Keys.sessionId);
  }



  Future<String?> getAccountLogin() =>
      _secureStorage.read(key: _Keys.accountLogin);

  Future<void> setAccountLogin(String value) {
    return _secureStorage.write(key: _Keys.accountLogin, value: value);
  }

  Future<void> deleteAccountLogin() {
    return _secureStorage.delete(key: _Keys.accountLogin);
  }



  Future<String?> getAccountPassword() =>
      _secureStorage.read(key: _Keys.accountPassword);

  Future<void> setAccountPassword(String value) {
    return _secureStorage.write(key: _Keys.accountPassword, value: value);
  }

  Future<void> deleteAccountPassword() {
    return _secureStorage.delete(key: _Keys.accountPassword);
  }


  Future<String?> getAccountCheck() =>
      _secureStorage.read(key: _Keys.accountCheck);

  Future<void> setAccountCheck(String value) {
    return _secureStorage.write(key: _Keys.accountCheck, value: value);
  }


}
