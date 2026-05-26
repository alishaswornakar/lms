import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/error_handler.dart';
import 'package:lms/core/models/profile.dart';
import 'package:lms/core/networks/dio_client.dart';

class ProfileRepository {
  final DioClient _client = DioClient();
  Future<Either<String, User>> getProfile() async {
    try {
      final response = await _client.dio.get(
        "profile/me/",

        // options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      User profile = User.fromMap(response.data);

      return Right(profile);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
