import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'Menu Chính',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Trang Chủ', '/home'),
          _buildDrawerItem(context, Icons.star, 'Power 6/55', '/power'),
          _buildDrawerItem(context, Icons.flash_on, 'Mega 6/45', '/mega'),
          _buildDrawerItem(context, Icons.casino, 'Lotto 6/35', '/lotto'),
          _buildDrawerItem(context, Icons.login, 'Đăng Nhập', '/login'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Đóng Drawer
        Navigator.pushNamed(context, route); // Điều hướng đến màn hình tương ứng
      },
    );
  }
}
