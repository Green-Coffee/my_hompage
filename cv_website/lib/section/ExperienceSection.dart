import 'package:flutter/material.dart';
import '../ui/Section.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Section(
      title: 'Professional Experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ExperienceEntry(
            position: 'Software Engineer',
            company: 'Siemens EDA, Korea',
            duration: 'Jul. 2025 – Present',
            details: [
              'Developing EDA tools in C/C++ for custom IC verification (Solido FastSPICE)',
            ],
          ),
          SizedBox(height: 12),
          _ExperienceEntry(
            position: 'Member of Technical Staff',
            company: 'Baum Design Systems Co., Ltd., Korea',
            duration: 'Jan. 2025 – Jun. 2025',
            details: [
              'Developed C/C++-based EDA tools for power analysis in digital circuit design (Power Wurzel).',
              'Researched AI-accelerated power modeling techniques.',
            ],
          ),
          SizedBox(height: 12),
          _ExperienceEntry(
            position: 'Research Assistant',
            company: 'Design Technology Lab (DT LAB), KAIST',
            duration: 'Aug. 2023 – Dec. 2024',
            details: [
              'Studied on fast computational techniques for MNA in PDN simulation.',
              'Researched decap placement optimization using RL for PDN impedance optimization.',
              'Utilized RTL-to-GDSII flow using EDA tools.',
            ],
          ),
          SizedBox(height: 12),
          _ExperienceEntry(
            position: 'Intern',
            company:
                'Samsung Electronics, Memory Division (Device Solutions), Korea',
            duration: 'Jun. 2022 – Jul. 2022',
            details: [
              'Participated in RTL design and logic synthesis of DRAM logic blocks.',
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceEntry extends StatelessWidget {
  final String position;
  final String company;
  final String duration;
  final List<String> details;

  const _ExperienceEntry({
    required this.position,
    required this.company,
    required this.duration,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(color: Colors.white)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$position, $company',
                style: theme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                duration,
                style: theme.bodyMedium?.copyWith(color: Colors.white),
              ),
              for (final line in details)
                Text(
                  '- $line',
                  style: theme.bodyMedium?.copyWith(color: Colors.white),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
