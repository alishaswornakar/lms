import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms/features/auth/models/token.dart';

final String _accessToken = "access_token";
final String _refreshToken = "refresh_token";

class TokenService {
  TokenService._();

  static TokenService get instance => TokenService._();

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> save(TokenModel tokenModel) async {
    try {
      await Future.wait([
        _secureStorage.write(key: _accessToken, value: tokenModel.access),
        _secureStorage.write(key: _refreshToken, value: tokenModel.refresh),
      ]);
    } catch (e) {
      throw "failed to save token $e";
    }
  }

  Future<String?> getAccessToken() async {
    final token = await _secureStorage.read(key: _accessToken);
    if (token == null) {
      return "token is null";
    }
    return token;
  }

  Future<String?> getRefreshToken() async {
    final token = await _secureStorage.read(key: _refreshToken);
    if (token == null) {
      return "refresh token is null";
    }
    return token;
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
