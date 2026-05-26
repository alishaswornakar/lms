import 'package:lms/core/models/token.dart';


class VerifyTokenResponseModel {
  final String detail;
  final TokenModel token;

  VerifyTokenResponseModel({required this.detail, required this.token});

  factory VerifyTokenResponseModel.fromMap(Map<String, dynamic> map) {
    return VerifyTokenResponseModel(
      detail: map['detail'],
      token: TokenModel.fromMap(map['token']),
    );
  }
}
