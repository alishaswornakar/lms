import 'package:dio/dio.dart';

class ErrorHandler {
  static String handleError(dynamic e) {
    if (e is DioException) {
      switch (e.type) {

        // No internet / socket issue
        case DioExceptionType.connectionError:
          return "No internet connection";

        // Connection timeout
        case DioExceptionType.connectionTimeout:
          return "Connection timeout. Please try again.";

        // Send timeout
        case DioExceptionType.sendTimeout:
          return "Request timeout while sending data.";

        // Receive timeout
        case DioExceptionType.receiveTimeout:
          return "Server is taking too long to respond.";

        // Invalid status code (400,401,404,500 etc.)
        case DioExceptionType.badResponse:
          final errorObj = e.response?.data;

          // String response
          if (errorObj is String) {
            return errorObj;
          }

          // JSON response
          else if (errorObj is Map) {

            // Common backend message key
            if (errorObj.containsKey("message")) {
              return errorObj["message"].toString();
            }

            // Django/DRF style errors
            if (errorObj.values.isNotEmpty) {
              final firstValue = errorObj.values.first;

              if (firstValue is String) {
                return firstValue;
              }

              if (firstValue is List && firstValue.isNotEmpty) {
                return firstValue.first.toString();
              }
            }
          }

          // Status code based messages
          switch (e.response?.statusCode) {
            case 400:
              return "Bad request";
            case 401:
              return "Unauthorized access";
            case 403:
              return "Access forbidden";
            case 404:
              return "Resource not found";
            case 500:
              return "Internal server error";
            default:
              return "Something went wrong";
          }

        // Request cancelled
        case DioExceptionType.cancel:
          return "Request was cancelled";

        // Certificate issue
        case DioExceptionType.badCertificate:
          return "Invalid certificate";

        // Unknown error
        case DioExceptionType.unknown:
          return "Unexpected error occurred";
      }
    }

    return e.toString();
  }
}