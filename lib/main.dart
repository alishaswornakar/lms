import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/bloc/profile/profile_bloc.dart';
import 'package:lms/core/bloc/token/token_cubit.dart';

import 'package:lms/core/routes/route.dart';
import 'package:lms/core/routes/route_name.dart';
import 'package:lms/features/auth/blocs/login/login_bloc.dart';
import 'package:lms/features/auth/blocs/sign_up/sign_up_bloc.dart';
import 'package:lms/features/auth/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:lms/features/auth/pages/login_page.dart';

import 'package:lms/features/course/blocs/get_category/category_bloc.dart';

import 'package:lms/features/trainer/blocs/apply/trainer_apply_bloc.dart';

import 'package:lms/features/trainer/blocs/trainer/my_trainer_profile_bloc.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => VerifyOtpBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => TrainerApplyBloc()),
        BlocProvider(create: (context) => MyTrainerProfileBloc()),
        BlocProvider(create: (context) => GetCategoryBloc()),
        BlocProvider(create: (context) => TokenCubit()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.spalsh,
        //onGenerateRoute: AppRoute.onGenerateRoute,
         onGenerateRoute: (settings) {},
        routes: {"/": (context) => LoginPage()},
      ),
    );
  }
}
