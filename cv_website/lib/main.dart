import 'package:flutter/material.dart';
import 'section/BiographySection.dart';
import 'section/EducationSection.dart';
import 'section/ContactSection.dart';
import 'section/ProjectsSection.dart';
import 'section/SkillsSection.dart';


void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minsueng Shin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CVHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CVHomePage extends StatelessWidget {
  const CVHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minseung Shin'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BiographySection(),
            EducationSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
            Center(child: Text('© 2025 Minseung Shin')),
          ],
        ),
      ),
    );
  }
}

