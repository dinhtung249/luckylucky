import 'package:flutter/material.dart';

class LottoScreen extends StatelessWidget {
  const LottoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lotto 6/35')),
      body: const Center(
        child: Text(
          'Lotto 6/35 đang xây dựng...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
