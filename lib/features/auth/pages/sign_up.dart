import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/widgets/custom_text_field.dart';

import 'package:lms/core/widgets/primary_button.dart';
import 'package:lms/features/auth/blocs/sign_up/sign_up_bloc.dart';

import 'package:lms/core/models/sign_up.dart';
import 'package:lms/features/auth/pages/login_page.dart';
import 'package:lms/features/auth/pages/verify_otp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 24),

                CustomTextField(
                  controller: _nameController,
                  label: "Name",
                  hintText: "Enter your name",
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length <= 3) {
                      return "Name cannot be less than 3";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                CustomTextField(
                  controller: _emailController,
                  label: "Email",
                  hintText: "Enter your email",
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return "Enter your valid email";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                CustomTextField(
                  controller: _passwordController,
                  label: "Password",
                  hintText: "Enter your password",
                  isObscure: _isObscure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length <= 8) {
                      return "Password cannot be less than 8 characters";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24),
                BlocListener<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpLoading) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 60,
                            width: 60,
                            color: Colors.white,
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    } else if (state is SignUpLoaded) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.msg)));
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const VerifyOtp(email: 'example1234567@example.com',),
                        )
                      );
                    
                    } else if (state is SignUpFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.msg)));
                      Navigator.of(context).pop();
                    }
                  },
                 child: Column(
    children: [
      PrimaryBtn(
        onPressed: () {
          if (!(_formKey.currentState?.validate() ?? false)) return;

          final signup = SignUpFormModel(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          );

          context.read<SignUpBloc>().add(SignUpEvent(signup));
        },
        child: const Text("Sign up"),
      ),

      const SizedBox(height: 20),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account? "),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 