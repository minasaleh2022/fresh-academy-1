enum UserRole { admin, trainer, trainee }

class AuthState {
  UserRole role;
  AuthState(this.role);
}

class RBAC {
  static bool canManageEverything(UserRole r) => r == UserRole.admin;
  static bool canManageCourses(UserRole r) => r == UserRole.admin || r == UserRole.trainer;
  static bool canViewOnly(UserRole r) => r == UserRole.trainee;
}
