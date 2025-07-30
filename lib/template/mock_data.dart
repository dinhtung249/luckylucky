// mock_data.dart

import '../models/post.dart';

final List<Post> mockPosts = [
  Post(
    id: '1',
    username: 'user1',
    avatarUrl: '',
    content: 'Hôm nay tôi chơi bộ số này: 01 12 23 34 45 55. Hy vọng sẽ trúng!',
    imageUrl: '',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    likes: 12,
    comments: 5,
  ),
  Post(
    id: '2',
    username: 'vietlott_fan',
    avatarUrl: '',
    content: 'Tôi đã tạch 20 lần liên tiếp rồi, ai đồng cảm không 😅',
    imageUrl: '',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    likes: 30,
    comments: 10,
  ),
  Post(
    id: '3',
    username: 'lucky_guy',
    avatarUrl: '',
    content: 'Mọi người thử chơi bộ này chưa? 04 11 26 33 42 49',
    imageUrl: '',
    timestamp: DateTime.now().subtract(const Duration(hours: 6)),
    likes: 7,
    comments: 3,
  ),
];
