enum UserRole { admin, trainer, trainee }

class AppUser {
  final String id, fullName, nationalId, email;
  final UserRole role;
  AppUser({required this.id, required this.fullName, required this.nationalId, required this.role, required this.email});

  factory AppUser.fromJson(Map<String, dynamic> j) => AppUser(
    id: j['id'], fullName: j['fullName'], nationalId: j['nationalId'],
    role: UserRole.values.firstWhere((e) => e.name == j['role']),
    email: j['email'],
  );
  Map<String, dynamic> toJson() => {
    'id': id, 'fullName': fullName, 'nationalId': nationalId, 'role': role.name, 'email': email,
  };
}
