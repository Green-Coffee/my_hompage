import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
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
      title: 'Minseung Shin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // ❌ ScrollBehavior 제거: web_smooth_scroll이 대신 처리
      home: const CVHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CVHomePage extends StatelessWidget {
  const CVHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Minseung Shin'),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // ✅ 배경 이미지
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // ✅ WebSmoothScroll로 부드러운 스크롤 적용
          WebSmoothScroll(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24.0),
              child: Center( // ← 여기가 중요!
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      BiographySection(),
                      EducationSection(),
                      SkillsSection(),
                      ProjectsSection(),
                      ContactSection(),
                      Center(
                        child: Text(
                          '© 2025 Minseung Shin',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
