import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // rootBundle

import 'Section.dart';

class BiographySection extends StatelessWidget {
  const BiographySection({super.key});

  Future<String> _loadBiography() async {
    return await rootBundle.loadString('assets/biography.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Biography',
      child: FutureBuilder<String>(
        future: _loadBiography(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return const Text(
              'Failed to load biography.',
              style: TextStyle(color: Colors.white),
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/profile.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    snapshot.data ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
