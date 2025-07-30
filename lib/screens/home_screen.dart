// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../widgets/feed_list.dart';
import '../widgets/recent_results_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Trang Chủ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Kết quả gần nhất',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const HeaderRecentResults(),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Bảng tin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            FeedList(),
          ],
        ),
      ),
    );
  }
}
