import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luckylucky/screens/login_screen.dart';
import 'package:luckylucky/screens/lotto_screen.dart';
import 'package:luckylucky/screens/mega_screen.dart';
import 'package:luckylucky/screens/power_screen.dart';
import 'package:luckylucky/screens/profile_screen.dart';

import 'firebase_options.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LuckyApp());
}

class LuckyApp extends StatelessWidget {
  const LuckyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LuckyLucky Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(),
      // initialRoute: '/',
      routes: {
        // '/': (context) => const HomeScreen(),
        '/power': (context) => const PowerScreen(),
        '/mega': (context) => const MegaScreen(),
        '/lotto': (context) => const LottoScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
