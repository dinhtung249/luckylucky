import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/power_screen.dart';
import 'screens/mega_screen.dart';
import 'screens/lotto_screen.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const LuckyApp());
}

class LuckyApp extends StatelessWidget {
  const LuckyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LuckyLucky Web',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    PowerScreen(),
    MegaScreen(),
    LottoScreen(),
    LoginScreen(),
  ];

  final List<String> _titles = const [
    'Trang chủ',
    'Power 6/55',
    'Mega 6/45',
    'Lotto 6/35',
    'Đăng nhập',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Trang chủ'),
          NavigationDestination(icon: Icon(Icons.bolt), label: '6/55'),
          NavigationDestination(icon: Icon(Icons.star), label: '6/45'),
          NavigationDestination(icon: Icon(Icons.casino), label: '6/35'),
          NavigationDestination(icon: Icon(Icons.login), label: 'Đăng nhập'),
        ],
      ),
    );
  }
}

