// lib/models/post.dart

class Post {
  final String id;
  final String username;
  final String avatarUrl;
  final String content;
  final String? imageUrl;
  final int likes;
  final int comments;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.content,
    this.imageUrl,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });

  factory Post.fromMap(Map<String, dynamic> data, String id) {
    return Post(
      id: id,
      username: data['username'] ?? '',
      avatarUrl: data['avatarUrl'] ?? '',
      content: data['content'] ?? '',
      imageUrl: data['imageUrl'],
      likes: data['likes'] ?? 0,
      comments: data['comments'] ?? 0,
      timestamp: DateTime.parse(data['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'avatarUrl': avatarUrl,
      'content': content,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
