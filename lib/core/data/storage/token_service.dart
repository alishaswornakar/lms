import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms/core/models/token.dart';

final String _accessKey = "Access";
final String _refreshKey = "Refresh";

class TokenService {
  TokenService._();

  static final TokenService instance = TokenService._();

  final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();

  Future<void> save(TokenModel tokenModel) async {
    try {
      await Future.wait([
        _secureStorage.write(
          key: _accessKey,
          value: tokenModel.accessToken,
        ),
        _secureStorage.write(
          key: _refreshKey,
          value: tokenModel.refreshToken,
        ),
      ]);
    } catch (e) {
      throw "Error saving token due to : $e";
    }
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessKey);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshKey);
  }

  Future<void> clearToken() async {
    await Future.wait([
      _secureStorage.delete(key: _accessKey),
      _secureStorage.delete(key: _refreshKey),
    ]);
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}