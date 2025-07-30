import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tên người đăng
            Text(
              post.username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Nội dung bài viết
            Text(post.content),
            const SizedBox(height: 12),

            // Like & Comment (hiển thị ngang)
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text('${post.likes} likes'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.comment_outlined, size: 18, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text('${post.comments} comments'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
