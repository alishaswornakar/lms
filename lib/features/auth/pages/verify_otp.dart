import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:lms/core/extension/context_extension.dart';
import 'package:lms/features/auth/blocs/verify_otp/verify_otp_bloc.dart';

import 'package:lms/features/home/pages/home.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40),

              Text(
                "Verify Otp",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),

              Text("Verify your otp send on $email"),

              SizedBox(height: 16),

              Center(
                child: BlocListener<VerifyOtpBloc, VerifyOtpState>(
                  listener: (context, state) {
                    if (state is VerifyOtpLoading) {
                      context.showLoadingDialog();
                    } else if (state is VerifyOtpSuccess) {
                      context.pop();
                      context.showSnackbar("Otp verified");
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (_) => false,
                      );
                    } else if (state is VerifyOtpFailure) {
                      context.pop();
                      context.showSnackbar(state.msg);
                    }
                  },
                  child: MaterialPinField(
                    length: 6,

                    onCompleted: (pin) {
                      context.read<VerifyOtpBloc>().add(
                        VerifyOtpEvent(
                          
                            email: email,
                            otp: pin,
                          ),
                      );
                      
                    },

                    theme: MaterialPinTheme(
                      shape: MaterialPinShape.filled,
                      cellSize: Size(50, 60),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
