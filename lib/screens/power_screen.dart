import 'package:flutter/material.dart';

class PowerScreen extends StatelessWidget {
  const PowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '🚧 Power 6/55 - Đang phát triển',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
