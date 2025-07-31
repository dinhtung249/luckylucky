import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({super.key});

  // 🧪 Danh sách tin nhắn mẫu
  final List<Map<String, String>> messages = const [
    {'user': 'Tùng', 'text': 'Hôm nay có ai trúng Mega không nhỉ?'},
    {'user': 'Lan', 'text': 'Tôi vừa trúng 3 số rồi 😎'},
    {'user': 'Minh', 'text': 'Power 6/55 chiều nay có vẻ xôm tụ!'},
    {'user': 'Tùng', 'text': 'Hy vọng lần này ăn giải lớn!'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final isMe = msg['user'] == 'Tùng'; // Giả định người dùng là Tùng

        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isMe ? Colors.indigo.shade100 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  msg['user']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(msg['text']!),
              ],
            ),
          ),
        );
      },
    );
  }
}
