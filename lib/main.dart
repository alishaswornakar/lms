import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms/core/bloc/profile/profile_bloc.dart';
// import 'package:lms/features/auth/blocs/OTP/otp_bloc.dart';
import 'package:lms/features/auth/blocs/login/login_bloc.dart';




import 'package:lms/features/auth/blocs/sign_up/sign_up_bloc.dart';
import 'package:lms/features/auth/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:lms/features/auth/pages/login_page.dart';

import 'package:lms/features/trainer/blocs/apply/trainer_apply_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "access_token");
  runApp(MyApp(isLoggedIn: token != null && token.isNotEmpty));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpBloc()),
      //BlocProvider(create: (context) => OtpBloc()),
        BlocProvider(create: (context) => VerifyOtpBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => TrainerApplyBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
       

         home: LoginPage(),
      ),
    );
  }
}
