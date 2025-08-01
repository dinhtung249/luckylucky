import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/email_verification_screen.dart';
import 'custom_input_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  void _handleRegister() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showError('Vui lòng điền đầy đủ thông tin');
      return;
    }

    if (password != confirmPassword) {
      _showError('Mật khẩu xác nhận không khớp');
      return;
    }

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((result) async {
      await result.user?.sendEmailVerification();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng ký thành công! Vui lòng kiểm tra email để xác thực.'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => EmailVerificationScreen()),
      );
    }).catchError((error) {
      _showError(error.toString());
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomInputField(
            label: 'Email',
            controller: _emailController,
            validator: (value) =>
            value!.isEmpty ? 'Vui lòng nhập email' : null,
            icon: Icons.email,
          ),
          CustomInputField(
            label: 'Mật khẩu',
            controller: _passwordController,
            validator: (value) =>
            value!.length < 6 ? 'Mật khẩu tối thiểu 6 ký tự' : null,
            icon: Icons.lock,
            isPassword: true,
            obscureText: _obscurePassword,
            onToggleObscure: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          CustomInputField(
            label: 'Xác nhận mật khẩu',
            controller: _confirmPasswordController,
            validator: (value) =>
            value != _passwordController.text ? 'Mật khẩu không khớp' : null,
            icon: Icons.lock_outline,
            isPassword: true,
            obscureText: _obscureConfirm,
            onToggleObscure: () {
              setState(() {
                _obscureConfirm = !_obscureConfirm;
              });
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _handleRegister();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade600,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Đăng Ký',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
