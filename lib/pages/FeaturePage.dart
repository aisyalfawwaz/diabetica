import 'package:diabetica/widgets/FeatureCard.dart';
import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan MediaQuery untuk mendapatkan lebar layar
    double screenWidth = MediaQuery.of(context).size.width;

    // Menghitung jumlah kolom berdasarkan lebar layar
    int crossAxisCount = screenWidth > 400 ? 2 : 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            FeatureCard(
              backgroundColor: Colors.blue,
              icon: Icons.restaurant,
              title: 'Food & Nutrition Recommendations',
              description: '',
            ),
            FeatureCard(
              backgroundColor: Colors.red,
              icon: Icons.chat_bubble,
              title: 'Consultation',
              description: '',
            ),
            FeatureCard(
              backgroundColor: Colors.amberAccent,
              icon: Icons.warning,
              title: 'Diabetic Complication Detection',
              description: '',
            ),
          ],
        ),
      ),
    );
  }
}
