// 
import 'package:dartz/dartz.dart';
import 'package:lms/core/data/storage/token_service.dart';
import 'package:lms/core/errors/error_handler.dart';
import 'package:lms/features/auth/models/login.dart';
import 'package:lms/features/auth/models/sign_up.dart';
import 'package:lms/core/models/token.dart';

import 'package:lms/core/networks/dio_client.dart';


// import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DioClient _dioClient = DioClient();

  Future<Either<String, String>> signup({required SignUpFormModel signup}) async {
    try {
      final response = await _dioClient.dio.post(
        "/auth/sign-up/",
        data: signup.toMap(),
      );
      return Right(response.data["detail"]);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

 Future<Either<String, String>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        "auth/verify-email/",
        data: {"email": email, "otp": otp},
      );

      final token = TokenModel.fromMap(response.data['token']);
      await TokenService.instance.save(token);
      return Right(response.data['detail']);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }




  Future<Either<String, String>> login({required LoginFormModel login}) async {
    try {
      final response = await _dioClient.dio.post(
        "/auth/login/",
        data: login.toMap(),
      );
      final token = TokenModel.fromMap(response.data["token"]);
      await TokenService.instance.save(token);
      return Right(response.data["detail"]);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  Future<Either<String, TokenModel>> refresh(String refresh) async {
    try {
      final response = await _dioClient.dio.post(
        "/auth/token/refresh/",
        data: {"refresh": refresh},
      );
      final token = TokenModel.fromMap(response.data);
      await TokenService.instance.save(token);
      return Right(response.data);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
