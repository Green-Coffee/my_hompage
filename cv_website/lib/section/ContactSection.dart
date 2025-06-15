import 'package:flutter/material.dart';
import 'Section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '📬 Contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('📧 minseung.shin@example.com'),
          Text('🔗 GitHub: github.com/minseung-shin'),
          Text('💼 LinkedIn: linkedin.com/in/minseung-shin'),
        ],
      ),
    );
  }
}
