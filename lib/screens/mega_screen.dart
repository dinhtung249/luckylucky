import 'package:flutter/material.dart';

class MegaScreen extends StatelessWidget {
  const MegaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '🚧 Mega 6/45 - Đang phát triển',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
