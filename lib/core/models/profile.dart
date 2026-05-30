class User {
  final String id;
  final String username;
  final String name;
  final String email;
  final List<dynamic> roles;
  final bool hastrainerprofile;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.roles,
    required this.hastrainerprofile,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',

      // SAFE ROLE LIST
      roles: List<dynamic>.from(map['roles'] ?? []),

      // IMPORTANT FIX
      hastrainerprofile:
          map['has_trainer_profile'] ?? false,
    );
  }
}