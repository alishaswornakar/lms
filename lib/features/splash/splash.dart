import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/bloc/token/token_cubit.dart';

import 'package:lms/core/routes/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<TokenCubit>().checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TokenCubit, TokenState>(
        listener: (context, state) {
          if (state is TokenAuthenticated) {
            Navigator.of(context).pushReplacementNamed(RouteName.home);
          } else if (state is TokenUnAuthenticated) {
            Navigator.of(context).pushReplacementNamed(RouteName.login);
          }
        },
        child: CircularProgressIndicator(),
      ),
    );
  }
}


