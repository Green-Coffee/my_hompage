import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ui/Section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '📬 Contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _launchEmail('minseung.shin@baum-ds.com'),
            child: const Text(
              '📧 minseung.shin@baum-ds.com',
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: () => _launchURL('https://github.com/Green-Coffee'),
            child: const Text(
              '🔗 GitHub: github.com/Green-Coffee',
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: () => _launchURL(
                'https://www.linkedin.com/in/minseung-shin-a4a016282/'),
            child: const Text(
              '💼 LinkedIn: linkedin.com/in/minseung-shin-a4a016282/',
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
