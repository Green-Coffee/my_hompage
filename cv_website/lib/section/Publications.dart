import 'package:flutter/material.dart';
import '../ui/Section.dart';
import '../ui/GlassChip.dart';
import 'package:url_launcher/url_launcher.dart';

// paper entry
class PaperEntry {
  final String title;
  final String authors;
  final String venue;
  final String? link;

  const PaperEntry({
    required this.title,
    required this.authors,
    required this.venue,
    this.link,
  });
}

final List<PaperEntry> conferencePapers = [
  const PaperEntry(
    title:
        'On-chip decoupling capacitor placement with impedance constraint for DRAM design',
    authors: 'Minseung Shin, Shilong Zhang, Geuna Chang, and Youngsoo Shin',
    venue: 'Proc. Int’l Symp. on Machine Learning for CAD (MLCAD), submitted',
//    link: '',
  ),
  const PaperEntry(
    title:
        'Fast and Accurate Analysis of Power Distribution Network Impedance for DRAM Design',
    authors: 'Minseung Shin, Shilong Zhang, and Youngsoo Shin',
    venue: 'Proc. Int’l Symp. on Circuits and Systems (ISCAS), accepted',
//    link: '',
  ),
  const PaperEntry(
    title:
        'A Compact Q-Learning-Based Standard Cell Layout Compiler for 3nm GAAFET and Beyond',
    authors: 'Minseung Shin, Jongbeom Kim, Yunjeong Shin, and Taigon Song',
    venue: 'Proc. Int’l SoC Design Conf. (ISOCC), Oct. 2023',
    link: 'https://ieeexplore.ieee.org/abstract/document/10396096',
  ),
  const PaperEntry(
    title:
        'High-throughput PIM for DRAM using Bank-level Pipelined Architecture',
    authors:
        'Hyunsoo Lee, Hyundong Lee, Minseung Shin, Gyuri Shin, Sumin Jeon, and Taigon Song',
    venue: 'Proc. Int’l SoC Design Conf. (ISOCC), Oct. 2023',
    link: 'https://ieeexplore.ieee.org/document/10396302',
  ),
];

Widget buildPaperEntry(PaperEntry paper, void Function(String) launchURL) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 왼쪽 논문 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(paper.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                const SizedBox(height: 4),
                Text(paper.authors,
                    style: const TextStyle(color: Colors.white)),
                Text(paper.venue, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // 오른쪽 GlassChip or "Pending" 표시
          paper.link != null
              ? GlassChip(
                  label: 'Link',
                  icon: Icons.link,
                  onTap: () => launchURL(paper.link!),
                )
              : const GlassChip(
                  label: 'Pending',
                  icon: Icons.hourglass_empty,
                ),
        ],
      ));
}

class PublicationSection extends StatelessWidget {
  const PublicationSection({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Publications',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Conference Papers',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          for (final paper in conferencePapers)
            buildPaperEntry(paper, _launchURL),
        ],
      ),
    );
  }
}
