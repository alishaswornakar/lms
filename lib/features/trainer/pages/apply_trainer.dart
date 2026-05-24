import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/widgets/custom_text_field.dart';
import 'package:lms/core/widgets/primary_button.dart';

import 'package:lms/features/trainer/blocs/apply/trainer_apply_bloc.dart';
import 'package:lms/features/trainer/model/apply_form.dart';

class ApplyTrainer extends StatefulWidget {
  const ApplyTrainer({super.key});

  @override
  State<ApplyTrainer> createState() => _ApplyTrainerState();
}

class _ApplyTrainerState extends State<ApplyTrainer> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _expertiseController = TextEditingController();
  final TextEditingController _experienceYears = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    _expertiseController.dispose();
    _experienceYears.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply for Trainer')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            CustomTextField(
              controller: _bioController,
              label: "Bio",
              hintText: "Enter your bio",
            ),
            CustomTextField(
              controller: _expertiseController,
              label: "Expertise",
              hintText: "Enter your expertize",
            ),
            CustomTextField(
              controller: _experienceYears,
              label: "Expereince year",
              hintText: "Experience year",
            ),
            SizedBox(),
            BlocBuilder<TrainerApplyBloc, TrainerApplyState>(
              builder: (context, state) {
                return PrimaryBtn(
                  isLoading: state is TrainerApplyLoading,
                  onPressed: () {
                    int experienceYear =
                        int.tryParse(_experienceYears.text) ?? 0;
                    final form = TraienrApplyForm(
                      bio: _bioController.text,
                      expertizes: _expertiseController.text,
                      experienceYears: experienceYear,
                    );
                    context.read<TrainerApplyBloc>().add(
                      TrainerApplyEvent(form),
                    );
                  },
                  child: Text("Submit"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
