
// ignore_for_file: public_member_api_docs, sort_constructors_first
class TraienrApplyForm {
  final String bio;
  final String expertizes;
  final int experienceYears;
  TraienrApplyForm({
    required this.bio,
    required this.expertizes,
    required this.experienceYears,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bio': bio,
      'expertise': expertizes,
      'experience_years': experienceYears,
    };
  }
}
