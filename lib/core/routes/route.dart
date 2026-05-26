import 'package:flutter/material.dart';
import 'package:lms/core/routes/route_name.dart';
import 'package:lms/features/auth/pages/login_page.dart';
import 'package:lms/features/auth/pages/sign_up.dart';
import 'package:lms/features/auth/pages/verify_otp.dart';
import 'package:lms/features/course/page/category%20_course.dart';

import 'package:lms/features/home/pages/home.dart';
import 'package:lms/features/splash/splash.dart';


class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;

    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
        

          case RouteName.verifyOtp:
            return VerifyOtp(email: args['email']);

          case RouteName.signup:
            return SignUpPage();

          case RouteName.login:
            return LoginPage();

          case RouteName.createCourse:
            return CreateCoursePage();

            case RouteName.spalsh:
            return SplashPage();

              case RouteName.home:
            return HomePage();

          default:
            return Scaffold(body: Text("Invalid 404 route not found"));
        }
      },
    );
  }
}
