import 'package:flutter/material.dart';
import 'Section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '🛠 Skills',
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: const [
          Chip(label: Text('C++')),
          Chip(label: Text('Dart')),
          Chip(label: Text('Flutter')),
          Chip(label: Text('Verilog')),
          Chip(label: Text('Python')),
          Chip(label: Text('EDA Tools')),
        ],
      ),
    );
  }
}