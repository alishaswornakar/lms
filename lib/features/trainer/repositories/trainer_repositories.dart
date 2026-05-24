import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/data/storage/token_service.dart';
import 'package:lms/core/errors/error_handler.dart';
import 'package:lms/core/networks/dio_client.dart';
import 'package:lms/features/trainer/model/apply_form.dart';
import 'package:lms/features/trainer/model/trainer.dart';

class TrainerRepository {
  final DioClient _client = DioClient();
  Future<Either<String, String>> applyForTrainer(TraienrApplyForm form) async {
    try {
      final acccessToken = await TokenService.instance.getAccessToken();
      await _client.dio.post(
        "trainer/apply/",

        options: Options(headers: {'Authorization': "Bearer $acccessToken"}),

        data: form.toMap(),
      );

      return Right("sucess");
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
   Future<Either<String, TrainerProfile>> getMyProfile() async {
    try {
      final response = await _client.dio.get("trainer/me/");

      final TrainerProfile profile = TrainerProfile.fromMap(response.data);
      return Right(profile);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
