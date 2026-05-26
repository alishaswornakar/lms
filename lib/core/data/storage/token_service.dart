import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms/core/models/token.dart';


final String _accessKey = "Access";
final String _refreshKey = "Refresh";

class TokenService {
  TokenService._();

  static TokenService get instance => TokenService._();

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> save(TokenModel tokenModel) async {
    try {
      await Future.wait([
        _secureStorage.write(key: _accessKey, value: tokenModel.accessToken),
        _secureStorage.write(key: _refreshKey, value: tokenModel.refreshToken),
      ]);
    } catch (e) {
      throw "Error saving token due to : $e";
    }
  }

  Future<String?> getAccessToken() async {
    // await Future.delayed(Duration(seconds: 3));
    final token = await _secureStorage.read(key: _accessKey);
    // if (token == null) {
    //   throw "Your token is null";
    // }
    return token;
  }

  Future<void> clearToken() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      print(e);
      throw "Unable to delete local data";
    }
  }
}
