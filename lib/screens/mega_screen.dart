import 'package:flutter/material.dart';

class MegaScreen extends StatelessWidget {
  const MegaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mega 6/45')),
      body: const Center(
        child: Text(
          'Mega 6/45 đang xây dựng...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
