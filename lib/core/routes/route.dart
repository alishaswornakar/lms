import 'package:flutter/material.dart';
import 'package:lms/core/routes/route_name.dart';
import 'package:lms/features/auth/pages/sign_up.dart';
import 'package:lms/features/auth/pages/verify_otp.dart';
import 'package:lms/features/course/page/category%20_course.dart';

import 'package:lms/features/home/pages/home.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;

    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case RouteName.home:
            return HomePage();

          case RouteName.verifyOtp:
            return VerifyOtp(email: args["email"]);

          case RouteName.signup:
            return SignUpPage();

          case CreateCoursePage.routeName:
            return CreateCoursePage();

          default:
            return Scaffold(body: Text("Invalid 404 route not found"));
        }
      },
    );
  }
}
