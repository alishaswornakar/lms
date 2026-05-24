import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/data/storage/token_service.dart';
import 'package:lms/core/errors/error_handler.dart';
import 'package:lms/features/auth/models/profile.dart';
import 'package:lms/core/networks/dio_client.dart';

class ProfileRepository {
  final DioClient _client = DioClient();
  Future<Either<String, Profile>> getProfile() async {
    try {
      final String? accessToken = await TokenService.instance.getAccessToken();

      final response = await _client.dio.get(
        "profile/me/",

        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      Profile profile = Profile.fromMap(response.data);

      return Right(profile);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
