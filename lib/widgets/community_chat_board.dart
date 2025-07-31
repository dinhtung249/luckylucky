import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommunityChatBoard extends StatefulWidget {
  const CommunityChatBoard({super.key});

  @override
  State<CommunityChatBoard> createState() => _CommunityChatBoardState();
}

class _CommunityChatBoardState extends State<CommunityChatBoard> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // ❌ Chưa đăng nhập → thông báo + điều hướng
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Bạn cần đăng nhập để gửi tin nhắn."),
          action: SnackBarAction(
            label: "Đăng nhập",
            onPressed: () {
              // Điều hướng sang tab đăng nhập (giả sử index 4 là login)
              DefaultTabController.of(context).animateTo(4);
              // Hoặc nếu dùng BottomNavigationBar → bạn cần truyền callback để đổi index
            },
          ),
        ),
      );
      return;
    }

    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      // 📨 Gửi chat (ví dụ lưu vào Firestore)
      print("Đã gửi tin nhắn: $message");
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("💬 Khu vực chat cộng đồng"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Nhập tin nhắn...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _handleSend,
                child: const Text("Gửi"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
