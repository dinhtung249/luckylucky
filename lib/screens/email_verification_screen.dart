import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  EmailVerificationScreenState createState() => EmailVerificationScreenState();
}

class EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isVerified = false;
  bool _isSending = false;

  Future<void> _checkVerification() async {
    User? user = _auth.currentUser;
    await FirebaseAuth.instance.currentUser?.reload();
    // reload để cập nhật trạng thái xác thực
    setState(() {
      _isVerified = user?.emailVerified ?? false;
    });

    // Thêm dòng kiểm tra 'mounted' ngay trước khi sử dụng context
    if (!mounted) {
      return;
    }
    if (_isVerified) {
      Navigator.pushReplacementNamed(context, '/login'); // Hoặc tới Home/Profile tùy theo flow
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email chưa được xác minh. Vui lòng kiểm tra lại.')),
      );
    }
  }

  Future<void> _resendEmail() async {
    setState(() => _isSending = true);

    try {
      await _auth.currentUser?.sendEmailVerification();

      // Thêm dòng kiểm tra 'mounted' ngay sau khi await
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email xác minh đã được gửi lại!')),
      );
    } catch (e) {
      // Thêm dòng kiểm tra 'mounted' trong khối catch
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gửi email thất bại: ${e.toString()}')),
      );
    } finally {
      // Chỉ gọi setState nếu widget còn được gắn vào cây
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Xác minh Email')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email_outlined, size: 80, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              'Vui lòng kiểm tra email để kích hoạt tài khoản.\nĐừng quên xem mục Spam nữa nhé!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _checkVerification,
              child: Text('Tôi đã xác minh'),
            ),
            TextButton(
              onPressed: _isSending ? null : _resendEmail,
              child: Text(_isSending ? 'Đang gửi...' : 'Gửi lại email xác minh'),
            ),
          ],
        ),
      ),
    );
  }
}
