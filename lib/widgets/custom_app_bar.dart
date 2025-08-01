import 'package:firebase_auth/firebase_auth.dart';
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
          : FirebaseAuth.instance.currentUser == null
          ? [
        _NavItem(title: 'Trang Chủ', route: '/'),
        _NavItem(title: 'Power 6/55', route: '/power'),
        _NavItem(title: 'Mega 6/45', route: '/mega'),
        _NavItem(title: 'Lotto 6/35', route: '/lotto'),
        _NavItem(title: 'Đăng Nhập', route: '/login'),
      ]
          : [
        _NavItem(title: 'Trang Chủ', route: '/'),
        _NavItem(title: 'Power 6/55', route: '/power'),
        _NavItem(title: 'Mega 6/45', route: '/mega'),
        _NavItem(title: 'Lotto 6/35', route: '/lotto'),
        _NavItem(title: 'Hồ Sơ', route: '/profile'),
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
    // Lấy tên route hiện tại từ stack điều hướng
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return TextButton(
      onPressed: () {
        // Kiểm tra nếu route hiện tại giống với route của item
        if (currentRoute == route) {
          // Sử dụng pushReplacementNamed để thay thế route hiện tại,
          // tránh việc stack bị chồng lên và xuất hiện nút back không cần thiết.
          Navigator.pushReplacementNamed(context, route);
        } else {
          // Sử dụng pushNamed để chuyển hướng đến trang mới
          Navigator.pushNamed(context, route);
        }
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