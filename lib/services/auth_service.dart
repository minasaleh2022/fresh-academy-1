import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/remote/api_client.dart';
import '../models/user.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.read(apiClientProvider);
  return AuthService(dio);
});

class AuthService {
  final Dio _dio;
  AuthService(this._dio);

  AppUser? currentUser;
  String? _jwt;

  bool get isLoggedIn => currentUser != null;
  bool hasRole(UserRole role) => currentUser?.role == role;

  Future<AppUser> loginWithNationalId({
    required String nationalId,
    required String password,
  }) async {
    final demo = {
      '10000000000000': {'role': 'admin',   'name': 'Admin User',   'email': 'admin@fresh.com'},
      '20000000000000': {'role': 'trainer', 'name': 'Trainer User', 'email': 'trainer@fresh.com'},
      '30000000000000': {'role': 'trainee', 'name': 'Trainee User', 'email': 'trainee@fresh.com'},
    };
    if (!demo.containsKey(nationalId) || password.isEmpty) {
      throw Exception('بيانات الدخول غير صحيحة');
    }
    final d = demo[nationalId]!;
    currentUser = AppUser(
      id: nationalId,
      fullName: d['name']!,
      nationalId: nationalId,
      role: UserRole.values.firstWhere((e) => e.name == d['role']),
      email: d['email']!,
    );
    _jwt = 'demo-token-$nationalId';
    final box = Hive.box('auth');
    await box.put('jwt', _jwt);
    await box.put('user', currentUser!.toJson());
    return currentUser!;
  }

  Future<void> logout() async {
    currentUser = null; _jwt = null;
    await Hive.box('auth').clear();
  }
}
