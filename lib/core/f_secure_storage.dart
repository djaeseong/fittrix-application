import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FSecureStorage {
  static const String _password = "PASSWORD";

  static final FSecureStorage _instance = FSecureStorage._internal();

  factory FSecureStorage() {
    return _instance;
  }

  FSecureStorage._internal();
  static const iOptions =
      IOSOptions(accessibility: KeychainAccessibility.unlocked_this_device);
  static const aOptions = AndroidOptions(encryptedSharedPreferences: true);
  static const secureStorage =
      FlutterSecureStorage(iOptions: iOptions, aOptions: aOptions);

  static Future<void> setPassword(String password) async {
    await secureStorage.write(key: _password, value: password);
  }

  static Future<String> getPassword() async {
    return await secureStorage.read(key: _password) ?? '';
  }

  static Future<void> deleteAll() async {
    await secureStorage.deleteAll();
  }
}
