import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/bloc/profile/profile_bloc.dart';
import 'package:lms/core/models/profile.dart';

import 'package:lms/features/trainer/pages/apply_trainer.dart';
import 'package:lms/features/trainer/pages/trainer.dart';

class HomePage extends StatefulWidget {
   static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileBloc>().add(ProfileEvent());
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    bool hasTrainerProfile = state.profile.hasTrainerProfile;
                    return FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => hasTrainerProfile
                                ? TrainerPage()
                                : ApplyTrainer(),
                          ),
                        );
                      },
                      child: Text(
                        hasTrainerProfile
                            ? "Navigate to Trainer"
                            : "Become a trainer",
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text("welcome home")),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              
              ),
            );
          }
          if (state is ProfileLoaded) {
            return Center(
              child: Column(
                children: [
                  Text(state.profile.name, style: TextStyle(fontSize: 30)),
                  Text(
                    state.profile.email,
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            );
          }
          if (state is ProfileFailure) {
            return Text(state.msg);
          }
          return SizedBox();
        },
      ),
    );
  }
}
