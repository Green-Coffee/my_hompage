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
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Failed to load biography.');
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
                    style: Theme.of(context).textTheme.bodyMedium,
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
