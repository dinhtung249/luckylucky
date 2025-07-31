import 'package:flutter/material.dart';
import '../models/player_model.dart';

class TopPlayers extends StatelessWidget {
  const TopPlayers({super.key});

  // 👥 Danh sách người chơi mẫu
  final List<PlayerModel> players = const [
    PlayerModel(name: 'Nguyễn Văn A', wins: 12),
    PlayerModel(name: 'Trần Thị B', wins: 9),
    PlayerModel(name: 'Lê Cường C', wins: 8),
    PlayerModel(name: 'Phạm Duy D', wins: 7),
    PlayerModel(name: 'Vũ Thị E', wins: 6),
    PlayerModel(name: 'Hoàng Văn F', wins: 5),
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    int crossAxisCount = isMobile ? 2 : 4;

    return Column(
      children: [
        const Text(
          '🏆 Top Cao Thủ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: players.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            final player = players[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      player.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    Text('Số lần trúng: ${player.wins}'),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
