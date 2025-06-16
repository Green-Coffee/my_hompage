import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'section/BiographySection.dart';
import 'section/EducationSection.dart';
import 'section/ContactSection.dart';
import 'section/Publications.dart';
import 'section/SkillsSection.dart';
import 'section/ExperienceSection.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minseung Shin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CVHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CVHomePage extends StatefulWidget {
  const CVHomePage({super.key});
  @override
  State<CVHomePage> createState() => _CVHomePageState();
}

class _CVHomePageState extends State<CVHomePage> {
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<double> offsetNotifier = ValueNotifier<double>(0.0);
  final GlobalKey _contentKey = GlobalKey();

  double contentHeight = 2000; // 초기값 (스크롤 콘텐츠 예상값)

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      offsetNotifier.value = scrollController.offset * 0.3;
    });

    // 콘텐츠 높이 측정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = _contentKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        setState(() {
          contentHeight = box.size.height;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    offsetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ✅ 배경: contentHeight 기반으로 높이 설정
          ValueListenableBuilder<double>(
            valueListenable: offsetNotifier,
            builder: (context, offset, _) {
              return Positioned(
                top: -offset,
                left: 0,
                right: 0,
                height: contentHeight + offset,
                child: Image.asset(
                  'assets/background.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              );
            },
          ),

          // ✅ 본문 콘텐츠
          WebSmoothScroll(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    key: _contentKey, // height 측정용
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      BiographySection(),
                      ExperienceSection(),
                      EducationSection(),
                      SkillsSection(),
                      PublicationSection(),
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
