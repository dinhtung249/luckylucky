import 'package:flutter/material.dart';
import '../widgets/chat_box.dart';
import '../widgets/chat_input.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/footer_section.dart';
import '../widgets/top_players.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      drawer: isMobile ? const DrawerMenu() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔶 Banner chính
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Chào mừng đến với LuckyLucky!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Hiển thị trang "Đang xây dựng"
                    },
                    child: const Text('Tham gia ngay'),
                  ),
                ],
              ),
            ),

            // 🎯 Top Cao Thủ
            const SizedBox(height: 24),
            const TopPlayers(),

            // 💬 Khung chát
            const SizedBox(height: 24),
            SizedBox(
              height: 400,
              child: Column(
                children: const [
                  Expanded(child: ChatBox()),
                  ChatInput(),
                ],
              ),
            ),

            // 📄 Footer
            const SizedBox(height: 24),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}