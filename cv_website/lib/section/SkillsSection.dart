import 'package:flutter/material.dart';
import '../ui/Section.dart';
import '../ui/GlassChip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const skills = [
      ('C/C++', Icons.code),
      ('Machine Learning', Icons.psychology),
      ('Design Methology', Icons.design_services),
      ('Design Verification', Icons.fact_check),
      ('TCL/TK', Icons.terminal),
      ('EDA Tools', Icons.build),
    ];

    return Section(
      title: 'Skills',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (var (label, icon) in skills) GlassChip(label: label, icon: icon),
        ],
      ),
    );
  }
}
