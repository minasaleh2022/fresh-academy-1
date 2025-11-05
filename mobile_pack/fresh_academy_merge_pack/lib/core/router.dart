redirect: (ctx, state) {
  if (state.matchedLocation == '/login' && auth.isLoggedIn) {
    final role = auth.currentUser?.role;

    switch (role) {
      case UserRole.admin:
        return '/admin';
      case UserRole.trainer:
        return '/trainer';
      case UserRole.trainee:
        return '/trainee';
      case null:
      default:
        return '/login';
    }
  }
  return null;
},
