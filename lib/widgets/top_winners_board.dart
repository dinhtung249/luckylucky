import 'package:flutter/material.dart';

/// Widget hiển thị top người chơi trúng giải nhiều nhất (mock dữ liệu)
class TopWinnersBoard extends StatelessWidget {
  const TopWinnersBoard({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách mock tạm thời
    final topUsers = [
      {'name': 'Nguyễn Văn A', 'wins': 5, 'biggestPrize': 'Jackpot 1'},
      {'name': 'Lê Thị B', 'wins': 5, 'biggestPrize': 'Jackpot 2'},
      {'name': 'Trần C', 'wins': 4, 'biggestPrize': 'Giải ba'},
      {'name': 'Mai D', 'wins': 3, 'biggestPrize': 'Giải nhì'},
      {'name': 'Phạm E', 'wins': 3, 'biggestPrize': 'Giải khuyến khích'},
    ];

    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🏆 Top Cao Thủ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...topUsers.map((user) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(user['name'] as String),
              subtitle: Text(
                'Số lần trúng: ${user['wins']} • Giải lớn nhất: ${user['biggestPrize']}',
              ),
            )),
          ],
        ),
      ),
    );
  }
}
