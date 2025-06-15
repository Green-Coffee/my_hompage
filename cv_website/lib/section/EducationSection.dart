import 'package:flutter/material.dart';
import 'Section.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Education',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _EducationEntry(
            school: 'Korea Advanced Institute of Science and Technology (KAIST), Daejeon, South Korea',
            degree: 'M.S. in Electrical Engineering',
            duration: 'Sep. 2023 – Feb. 2025 (Early graduation)',
            advisor: 'Prof. Youngsoo Shin',
            thesis: 'Fast Impedance Simulation for Power Distribution Networks',
            gpa: 'Cumulative GPA: 3.5 / 4.5',
          ),
          SizedBox(height: 12),
          _EducationEntry(
            school: 'Kyungpook National University (KNU), Daegu, South Korea',
            degree: 'B.S. in Electronics Engineering',
            duration: 'Mar. 2018 – Aug. 2023 (Early graduation)',
            advisor: '',
            thesis: '',
            gpa: 'Cumulative GPA: 4.38 / 4.5 (Ranked 1st out of 98 students)',
          ),
          SizedBox(height: 12),
          _EducationEntry(
            school: 'Gimhae Daecheong High School',
            degree: '',
            duration: 'Mar. 2015 – Feb. 2018',
            advisor: '',
            thesis: '',
            gpa: '',
          ),
        ],
      ),
    );
  }
}

class _EducationEntry extends StatelessWidget {
  final String school;
  final String degree;
  final String duration;
  final String advisor;
  final String thesis;
  final String gpa;

  const _EducationEntry({
    required this.school,
    required this.degree,
    required this.duration,
    required this.advisor,
    required this.thesis,
    required this.gpa,
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
                school,
                style: theme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (degree.isNotEmpty)
                Text(
                  degree,
                  style: theme.bodyLarge?.copyWith(color: Colors.white),
                ),
              Text(
                duration,
                style: theme.bodyMedium?.copyWith(color: Colors.white),
              ),
              if (advisor.isNotEmpty)
                Text(
                  'Advisor: $advisor',
                  style: theme.bodyMedium?.copyWith(color: Colors.white),
                ),
              if (thesis.isNotEmpty)
                Text(
                  'Thesis: $thesis',
                  style: theme.bodyMedium?.copyWith(color: Colors.white),
                ),
              if (gpa.isNotEmpty)
                Text(
                  gpa,
                  style: theme.bodyMedium?.copyWith(color: Colors.white),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
