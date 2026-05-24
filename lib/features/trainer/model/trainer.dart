import 'package:lms/core/models/profile.dart';

class TrainerProfile {
  final String id;
  final String bio;
  final String expertise;
  final int experienceYears;
  final Review? review;
  final Suspension? suspension;
  final Profile user;

  TrainerProfile({
    required this.id,
    required this.bio,
    required this.expertise,
    required this.experienceYears,
    this.review,
    this.suspension,
    required this.user,
  });

  factory TrainerProfile.fromMap(Map<String, dynamic> json) => TrainerProfile(
    id: json["id"] ?? "",
    bio: json["bio"] ?? "",
    expertise: json["expertise"] ?? "",
    experienceYears: json["experience_years"] ?? 0,
    review: json["review"] == null ? null : Review.fromMap(json["review"]),
    suspension: json["suspension"] == null
        ? null
        : Suspension.fromMap(json["suspension"]),

    user: Profile.fromMap(json['user']),
  );
}

class Review {
  final String status;
  final String rejectionReason;
  final DateTime? reviewedAt;

  Review({
    required this.status,
    required this.rejectionReason,
    this.reviewedAt,
  });

  factory Review.fromMap(Map<String, dynamic> json) => Review(
    status: json["status"] ?? "",
    rejectionReason: json["rejection_reason"] ?? "",
    reviewedAt: json["reviewed_at"] == null
        ? null
        : DateTime.parse(json["reviewed_at"]),
  );
}

class Suspension {
  final bool isSuspended;
  final String reason;
  final DateTime? suspendedAt;

  Suspension({
    required this.isSuspended,
    required this.reason,
    this.suspendedAt,
  });

  factory Suspension.fromMap(Map<String, dynamic> json) => Suspension(
    isSuspended: json["is_suspended"] ?? false,
    reason: json["reason"] ?? "",
    suspendedAt: json["suspended_at"] == null
        ? null
        : DateTime.parse(json["suspended_at"]),
  );
}
