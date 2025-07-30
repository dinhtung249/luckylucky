// lib/repository/post_repository.dart

import '../models/post.dart';

class PostRepository {
  // Đây là dữ liệu giả lập dùng để hiển thị trong giao diện
  final List<Post> _mockPosts = [
    Post(
      username: 'Vietlott Master',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
      content: 'Mình vừa chơi Power 6/55, số đẹp cực kỳ!',
      imageUrl: 'https://source.unsplash.com/random/400x200?lottery',
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      likes: 12,
      comments: 4, id: '',
    ),
    Post(
      username: 'LuckyMan',
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
      content: 'Thử Mega 6/45 hôm nay, mọi người nghĩ sao về bộ số này?',
      imageUrl: null,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      likes: 8,
      comments: 2, id: '',
    ),
    Post(
      username: 'Admin',
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
      content: '📢 Đừng quên thống kê số theo tuần để tìm quy luật nhé!',
      imageUrl: 'https://source.unsplash.com/random/400x200?statistics',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      likes: 21,
      comments: 9, id: '',
    ),
  ];

  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(milliseconds: 500)); // giả delay
    return _mockPosts;
  }
}
