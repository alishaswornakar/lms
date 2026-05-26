// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String username;
  final String name;
  final String email;
  final bool hasTrainerProfile;
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.hasTrainerProfile,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      name: map['name'],
      email: map['email'],
      hasTrainerProfile: map['has_trainer_profile'],
    );
  }
}
