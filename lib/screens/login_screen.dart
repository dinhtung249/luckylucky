import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final String? emailPrefill;
  final Key? forceRefreshKey;
  const LoginScreen({super.key, this.emailPrefill, this.forceRefreshKey});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _handleNotVerified(BuildContext context, User user) async {
    await user.sendEmailVerification();
    await FirebaseAuth.instance.signOut();

    if (context.mounted) {
      // Hiện thông báo dạng banner phía trên cùng
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: const Text(
              "📧 Vui lòng kiểm tra email (bao gồm cả hộp thư Rác/Spam) và nhấn vào liên kết để kích hoạt tài khoản."),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text("Đóng"),
            ),
          ],
          backgroundColor: Colors.amber.shade100,
        ),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            emailPrefill: user.email,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SignInScreen(
            key: widget.forceRefreshKey ?? UniqueKey(),
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
            email: widget.emailPrefill,
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) async {
                final user = FirebaseAuth.instance.currentUser;
                if (user != null && !user.emailVerified) {
                  _handleNotVerified(context, user);
                } else {
                  final isNewUser = user!.metadata.creationTime == user.metadata.lastSignInTime;

                  if (isNewUser) {
                    Navigator.pushReplacementNamed(context, '/profile-setup');
                  } else {
                    Navigator.of(context).pop(); // hoặc chuyển về Home nếu cần
                  }
                }
              }),

            ],
            footerBuilder: (context, _) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text("🔥 Tạo tài khoản để gửi chat và tham gia cộng đồng"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text("Tạo tài khoản mới"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
