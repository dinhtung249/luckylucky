import 'package:flutter/material.dart';

class PowerScreen extends StatelessWidget {
  const PowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Power 6/55')),
      body: const Center(
        child: Text(
          'Power 6/55 đang xây dựng...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
