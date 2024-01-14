import 'package:flutter/material.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Fitur 1
            // Widget untuk fitur pertama
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Fitur 2
            // Widget untuk fitur kedua
          ],
        ),
        // Tambahkan baris atau grid untuk fitur-fitur lainnya
      ],
    );
  }
}
