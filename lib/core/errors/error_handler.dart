import 'package:dio/dio.dart';

class ErrorHandler {
  static String handelError(dynamic e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionError) {
        return "no internet";
      } else if (e.type == DioExceptionType.badResponse) {
        final errorObj = e.response?.data;

        if (errorObj is String) {
          return errorObj;
        } else if (errorObj is Map && errorObj.values.isNotEmpty) {
          final error = errorObj;
          if (error.values.first is String) {
            return error.values.first;
          } else if (error.values.first is List &&
              error.values.first.isNotEmpty) {
            final error2 = error.values.first;
            return error2.first;
          } else if (error.values.first is Map &&
              error.values.first.isNotEmpty) {
            return "Something";
          } else {
            return "error";
          }
        } else {
          return "Error:something went wrong";
        }
      } else {
        return "Error:something went wrong";
      }
    } else {
      return e.toString();
    }
  }
}
