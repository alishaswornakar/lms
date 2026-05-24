
// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  final String id;
  final String username;
  final String name;
  final String email;
  Profile({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      username: map['username'],
      name: map['name'],
      email: map['email'],
    );
  }

  bool get hasTrainerProfile => false;
}
