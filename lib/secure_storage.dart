import 'package:flutter/material.dart' show required;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureStorageKey {
  API_AUTH_TOKEN,
  API_REFRESH_TOKEN,
}

class SecureStorage {
  FlutterSecureStorage _storage;
  // external constructor
  static final SecureStorage _instance = SecureStorage._internalConstructor();
  // internal constructor
  SecureStorage._internalConstructor() {
    this._storage = FlutterSecureStorage();
  }

  factory SecureStorage() {
    return _instance;
  }

  Future<String> read(SecureStorageKey key) async {
    return _storage.read(key: key.toString());
  }

  Future<void> write({SecureStorageKey key, String value}) async {
    await _storage.write(key: key.toString(), value: value);
  }

  Future<void> delete(SecureStorageKey key) async {
    await _storage.delete(key: key.toString());
  }

  Future<void> saveApiTokens({@required String auth, @required String refresh}) async {
    Future.wait([
      write(key: SecureStorageKey.API_AUTH_TOKEN, value: auth),
      write(key: SecureStorageKey.API_REFRESH_TOKEN, value: refresh),
    ]).catchError((_) => Future.error('Erro interno ao salvar tokens'));
  }

  Future<void> clearApiTokens() async {
    Future.wait([
      delete(SecureStorageKey.API_AUTH_TOKEN),
      delete(SecureStorageKey.API_REFRESH_TOKEN),
    ]).catchError((_) => Future.error('Erro interno ao remover tokens'));
  }

  Future<bool> get hasAuthToken =>
      read(SecureStorageKey.API_AUTH_TOKEN).then((token) => (token ?? '').isNotEmpty);
}
