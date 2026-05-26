// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:lms/core/data/storage/token_service.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class DioClient {
//   late Dio dio;
//   DioClient() {
//     dio = Dio(
      
//       BaseOptions(
//         baseUrl: "https://lunar-lms.onrender.com/api/",
//     headers: {
//     // "content-Type": "application/json"
//     },
//         connectTimeout: const Duration(seconds: 20),
//         receiveTimeout: const Duration(seconds: 10)
        
//         )  );

//     // dio.interceptors.add(PrettyDioLogger());

//     // customization
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//         enabled: kDebugMode,
//         filter: (options, args) {
//           // don't print requests with uris containing '/posts'
//           if (options.path.contains('/posts')) {
//             return false;
//           }
//           // don't print responses with unit8 list data
//           return !args.isResponse || !args.hasUint8ListData;
//         },
//       ),
//     );
//   }
// }
// class AuthInterceptor extends Interceptor {
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//    final token = await TokenService.instance.getAccessToken();

// if (token != null && token.isNotEmpty) {
//   options.headers['Authorization'] = 'Bearer $token';
// }
// }
// }
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lms/core/data/storage/token_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://lunar-lms.onrender.com/api/",
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

   
    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }
}

// class AuthInterceptor extends Interceptor {
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     final token = await TokenService.instance.getAccessToken();

//     print("TOKEN => $token");

//     if (token != null && token.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $token';
//     }

//     // IMPORTANT
//     handler.next(options);
//   }
// }
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await TokenService.instance.getAccessToken();

    print("TOKEN => $token");

    if (token != null && token.isNotEmpty) {
      final formattedToken =
          token.startsWith('Bearer ')
              ? token
              : 'Bearer $token';

      options.headers['Authorization'] = formattedToken;
    }

    handler.next(options);
  }
}