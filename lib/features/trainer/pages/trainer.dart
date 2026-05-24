import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lms/features/course/page/category%20_course.dart';

import 'package:lms/features/trainer/blocs/trainer/my_trainer_profile_bloc.dart';
import 'package:lms/features/trainer/model/trainer.dart'; // Adjust path if needed

class TrainerPage extends StatefulWidget {
  const TrainerPage({super.key});

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MyTrainerProfileBloc>().add(MyTrainerProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trainer Profile'), centerTitle: true),
      endDrawer: _Drawer(),
      body: BlocBuilder<MyTrainerProfileBloc, MyTrainerProfileState>(
        builder: (context, state) {
          if (state is MyTrainerProfileLoading) {
            return SizedBox();
          } else if (state is MyTrainerProfileLoaded) {
            return _TrainerBody(trainer: state.trainer);
          } else if (state is MyTrainerProfileFailure) {
            return Text(state.msg);
          } else {
            return Text("Khali");
          }
        },
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(CreateCoursePage.routeName);
              },
              title: Text("Create course"),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrainerBody extends StatelessWidget {
  final TrainerProfile trainer;

  const _TrainerBody({required this.trainer});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderCard(),
          const SizedBox(height: 20),
          _buildStatusAlerts(),
          const SizedBox(height: 20),
          _buildSectionTitle('About & Expertise'),
          _buildInfoCard(),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Colors.blue.shade100,
              child: Text(
                trainer.user.name.isNotEmpty ? trainer.user.name[0] : 'T',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainer.user.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trainer.user.email,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${trainer.experienceYears} Years Experience',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusAlerts() {
    final hasSuspension = trainer.suspension?.isSuspended ?? false;
    final hasReview = trainer.review != null;

    return Column(
      children: [
        if (hasSuspension) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.gavel, color: Colors.red),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account Suspended',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Reason: ${trainer.suspension!.reason}',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (hasReview) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: trainer.review!.status == 'approved'
                  ? Colors.green.shade50
                  : Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: trainer.review!.status == 'approved'
                    ? Colors.green.shade200
                    : Colors.amber.shade300,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  trainer.review!.status == 'approved'
                      ? Icons.verified
                      : Icons.rate_review,
                  color: trainer.review!.status == 'approved'
                      ? Colors.green
                      : Colors.amber.shade800,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review Status: ${trainer.review!.status.toUpperCase()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: trainer.review!.status == 'approved'
                              ? Colors.green.shade800
                              : Colors.amber.shade900,
                        ),
                      ),
                      if (trainer.review!.rejectionReason.isNotEmpty)
                        Text(
                          'Reason: ${trainer.review!.rejectionReason}',
                          style: const TextStyle(fontSize: 13),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Expertise',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(trainer.expertise, style: const TextStyle(fontSize: 16)),
            const Divider(height: 24),
            const Text(
              'Biography',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              trainer.bio,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
