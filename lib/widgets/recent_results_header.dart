// lib/widgets/header_recent_results.dart

import 'package:flutter/material.dart';

class HeaderRecentResults extends StatelessWidget {
  const HeaderRecentResults({super.key});

  // Ví dụ tạm thời (sau này sẽ fetch từ Firebase)
  final List<Map<String, dynamic>> results = const [
    {
      'game': 'Power 6/55',
      'numbers': [12, 23, 34, 41, 5, 18]
    },
    {
      'game': 'Mega 6/45',
      'numbers': [3, 14, 22, 28, 35, 39]
    },
    {
      'game': 'Lotto 6/35',
      'numbers': [7, 12, 18, 22, 30, 33]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: results.map((result) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
          child: Row(
            children: [
              Text(
                '[${result['game']}]',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              ...result['numbers'].map<Widget>((num) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: Text(
                    num.toString().padLeft(2, '0'),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      }).toList(),
    );
  }
}
