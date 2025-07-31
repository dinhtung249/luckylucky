import 'package:flutter/material.dart';
import 'package:luckylucky/screens/power_screen.dart';
import '../widgets/community_chat_board.dart';
import '../widgets/lucky_drawer.dart';
import '../widgets/top_winners_board.dart';
import 'login_screen.dart';
import 'lotto_screen.dart';
import 'mega_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const PowerScreen(),
    const MegaScreen(),
    const LottoScreen(),
    const LoginScreen(),
  ];

  final List<String> _titles = [
    'Trang chủ',
    '6/55',
    '6/45',
    '6/35',
    'Đăng nhập',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      drawer: const LuckyDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: '6/55',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: '6/45',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            label: '6/35',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Đăng nhập',
          ),
        ],
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: const Color(0xFFF4F1FB),
    );
  }
}

// ✨ Chỉ còn phần nội dung chính (không có Scaffold nữa)
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TopWinnersBoard(),
          SizedBox(height: 8),
          CommunityChatBoard(),
        ],
      ),
    );
  }
}

