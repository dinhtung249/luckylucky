import 'package:flutter/material.dart';

class LuckyDrawer extends StatelessWidget {
  const LuckyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'LuckyLucky Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Giới thiệu'),
          ),
          const ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Thống kê nâng cao'),
          ),
          const ListTile(
            leading: Icon(Icons.post_add),
            title: Text('Đăng bài viết'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
          ),
        ],
      ),
    );
  }
}
