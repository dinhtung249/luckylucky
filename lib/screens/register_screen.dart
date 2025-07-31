import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/register_form.dart';
import 'email_verification_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Đăng Ký',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade800,
                  shadows: [
                    Shadow(blurRadius: 2, color: Colors.black26, offset: Offset(1, 1)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: RegisterForm(), // Widget form tách riêng
              ),
            ],
          ),
        ),
      ),
    );
  }
}

