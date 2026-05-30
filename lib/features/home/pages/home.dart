import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/bloc/profile/profile_bloc.dart';
import 'package:lms/core/data/storage/token_service.dart';
import 'package:lms/core/routes/route_name.dart';
import 'package:lms/core/widgets/custom_filled_button.dart';
import 'package:lms/features/course/page/category%20_course.dart';

import 'package:lms/features/trainer/pages/apply_trainer.dart';
import 'package:lms/features/trainer/pages/trainer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/home";

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    // LOADING
                    if (state is ProfileLoading) {
                      return Center(
                        child: LoadingAnimationWidget.newtonCradle(
                          color: Colors.black,
                          size: 60,
                        ),
                      );
                    }

                    // LOADED
                    if (state is ProfileLoaded) {
                      final user = state.profile;

                      // NULL CHECK
                      // if (user == null) {
                      //   return const Center(
                      //     child: Text(
                      //       "User data not found",
                      //     ),
                      //   );
                      // }

                      final bool hasTrainerProfile =
                          user.hastrainerprofile ?? false;

                      final String role =
                          user.roles.isNotEmpty
                              ? user.roles.first
                              : "";

                      return Column(
                        children: [
                          // PROFILE IMAGE
                          const CircleAvatar(
                            radius: 50,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // NAME
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          // USERNAME
                          Text(
                            "@${user.username}",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 5),

                          // EMAIL
                          Text(
                            user.email,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 25),

                          // GET COURSES
                          ListTile(
                            tileColor: const Color(0xFFE3F2FD),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),

                            leading: const Icon(Icons.menu_book),

                            title: const Text(
                              "Get Courses",
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),

                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateCoursePage(),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 12),

                          // APPLY TRAINER / TRAINER PROFILE
                          ListTile(
                            tileColor: const Color(0xFFEDE7F6),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),

                            leading: Icon(
                              hasTrainerProfile
                                  ? Icons.school
                                  : Icons.person_add,
                            ),

                            title: Text(
                              hasTrainerProfile
                                  ? "Trainer Profile"
                                  : "Apply for Trainer",
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),

                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      hasTrainerProfile
                                          ? TrainerPage()
                                          : ApplyTrainer(),
                                ),
                              );

                              // REFRESH PROFILE AFTER RETURN
                              context.read<ProfileBloc>().add(
                                    ProfileEvent(),
                                  );
                            },
                          ),

                          const SizedBox(height: 12),

                          // ADMIN OPERATION
                          if (role == "admin")
                            ListTile(
                              tileColor: const Color(0xFFFFF3E0),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),

                              leading: const Icon(
                                Icons.admin_panel_settings,
                              ),

                              title: const Text(
                                "Admin Operation",
                              ),

                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),

                              onTap: () {
                                // ADMIN PAGE NAVIGATION
                              },
                            ),
                        ],
                      );
                    }

                    // FAILURE
                    if (state is ProfileFailure) {
                      return Center(
                        child: Text(
                          state.msg,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),

                const SizedBox(height: 30),

                // LOGOUT BUTTON
                AppFilledButton(
                  text: "Logout",
                  icon: Icons.logout_rounded,
                  backgroundColor:
                      const Color.fromARGB(255, 60, 1, 70),

                  onPressed: () async {
                    await TokenService.instance.clear();

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteName.login,
                      (_) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // APP BAR
      appBar: AppBar(
        title: const Text("Welcome Home"),
      ),

      // BODY
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          // LOADING
          if (state is ProfileLoading) {
            return Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.red,
                rightDotColor: Colors.cyanAccent,
                size: 60,
              ),
            );
          }

          // LOADED
          if (state is ProfileLoaded) {
           final user = state.profile;

            // if (user == null) {
            //   return const Center(
            //     child: Text(
            //       "User data not found",
            //     ),
            //   );
            // }

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Welcome to LMS",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // FAILURE
          if (state is ProfileFailure) {
            return Center(
              child: Text(
                state.msg,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}