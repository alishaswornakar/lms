import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/error_handler.dart';
import 'package:lms/core/networks/dio_client.dart';
import 'package:lms/core/typedef/typedef.dart';
import 'package:lms/features/course/models/category.dart';

class CourseRepository {
  final DioClient _client = DioClient();
  FutureEither<List<CourseCategory>> getCategories() async {
    try {
      final response = await _client.dio.get("courses/categories/");
      final categories = List.from(
        response.data,
      ).map((e) => CourseCategory.fromMap(e)).toList();

      return Right(categories);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
