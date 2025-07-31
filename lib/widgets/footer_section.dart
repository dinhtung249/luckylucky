import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  final List<Map<String, dynamic>> footerItems = const [
    {'icon': Icons.rule, 'label': 'Điều Khoản'},
    {'icon': Icons.contact_mail, 'label': 'Liên Hệ'},
    {'icon': Icons.info_outline, 'label': 'Giới Thiệu'},
    {'icon': Icons.help_outline, 'label': 'Hướng dẫn'},
  ];

  void _showComingSoon(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label đang xây dựng...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 12,
        children: footerItems.map((item) {
          return GestureDetector(
            onTap: () => _showComingSoon(context, item['label']),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item['icon'], size: 20, color: Colors.indigo),
                const SizedBox(width: 4),
                Text(
                  item['label'],
                  style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
