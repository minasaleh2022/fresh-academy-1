import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../services/auth_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _nid = TextEditingController();
  final _pwd = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Image.asset('assets/logo/fresh_logo.png', height: 40, errorBuilder: (_, __, ___) => const SizedBox()),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nid,
                  decoration: const InputDecoration(labelText: 'الرقم القومي'),
                  keyboardType: TextInputType.number,
                  validator: (v) => (v==null || v.length<10) ? 'ادخل رقم قومي صحيح' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pwd, obscureText: true,
                  decoration: const InputDecoration(labelText: 'كلمة المرور'),
                  validator: (v) => (v==null || v.isEmpty) ? 'ادخل كلمة المرور' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : () async {
                      if (!_form.currentState!.validate()) return;
                      setState(() => _loading = true);
                      try {
                        await ref.read(authServiceProvider).loginWithNationalId(
                          nationalId: _nid.text.trim(), password: _pwd.text.trim(),
                        );
                        if (!mounted) return;
                        context.go('/admin');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
                      } finally { if (mounted) setState(() => _loading = false); }
                    },
                    child: _loading ? const CircularProgressIndicator() : const Text('تسجيل الدخول'),
                  ),
                ),
                const SizedBox(height: 8),
                Text('تجريب سريع:\nمدير: 10000000000000 / اي كلمة\nمدرب: 20000000000000 / اي كلمة\nمتدرب: 30000000000000 / اي كلمة'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
