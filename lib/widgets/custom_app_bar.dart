import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return AppBar(
      title: const Text('LuckyLucky'),
      backgroundColor: Colors.blue.shade700,
      actions: isMobile
          ? null
          : [
        _NavItem(title: 'Trang Chủ', route: '/home'),
        _NavItem(title: 'Power 6/55', route: '/power'),
        _NavItem(title: 'Mega 6/45', route: '/mega'),
        _NavItem(title: 'Lotto 6/35', route: '/lotto'),
        _NavItem(title: 'Đăng Nhập', route: '/login'),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final String route;
  const _NavItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
