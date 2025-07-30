// lib/widgets/feed_list.dart

import 'package:flutter/material.dart';
import 'package:luckylucky/widgets/post_card.dart';
import '../models/post.dart';
import '../repository/post_repository.dart';


class FeedList extends StatelessWidget {
  FeedList({super.key});

  final PostRepository _postRepository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: _postRepository.fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị loading khi đang lấy dữ liệu
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Thông báo lỗi nếu có
          return Center(child: Text('Lỗi khi tải dữ liệu: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Nếu không có dữ liệu
          return const Center(child: Text('Chưa có bài viết nào.'));
        } else {
          final posts = snapshot.data!;
          // Hiển thị danh sách bài viết
          return ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => const Divider(height: 8),
            itemBuilder: (context, index) {
              return PostCard(post: posts[index]);
            },
          );
        }
      },
    );
  }
}
