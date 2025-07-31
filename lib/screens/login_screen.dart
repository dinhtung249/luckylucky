import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luckylucky/screens/profile_setup_screen.dart';
import 'package:luckylucky/widgets/custom_input_field.dart';
import 'home_screen.dart';
import 'email_verification_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true; //toggle pw

  void _login() async {
    setState(() => _isLoading = true);

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final user = _auth.currentUser;
      if (user != null && user.emailVerified) {
        final isFirstTime = user.metadata.creationTime == user.metadata.lastSignInTime;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => isFirstTime ? ProfileSetupScreen() : const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => EmailVerificationScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width > 600 ? 400 : double.infinity;

    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          margin: MediaQuery.of(context).size.width > 600
              ? const EdgeInsets.only(top: 80)
              : const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Đăng Nhập', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text('Đăng Nhập'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white, // Đặt màu chữ thành trắng
                    shadowColor: Colors.black, // Đặt màu bóng thành đen
                    elevation: 8, // Tăng độ nổi của nút (độ cao)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bo tròn các góc
                    ),
                  ),
                  onPressed: _login,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Chưa có tài khoản?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) => RegisterScreen(),
                      ));
                    },
                    child: const Text('Đăng ký ngay'),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // TODO: Mở màn hình quên mật khẩu
                },
                child: const Text('Quên mật khẩu?'),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.indigo.shade50,
    );
  }
}
