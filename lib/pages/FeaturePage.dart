import 'package:diabetica/widgets/FeatureCard.dart';
import 'package:flutter/material.dart';
import 'FoodRecommendationPage.dart'; // Import halaman Food Recommendation Page

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
            // Gunakan GestureDetector atau InkWell untuk menangani interaksi ketika widget ditekan
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman Food Recommendation Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodRecommendationPage()),
                );
              },
              child: FeatureCard(
                backgroundColor: Colors.blue,
                icon: Icons.restaurant,
                title: 'Food & Nutrition Recommendations',
                description: '',
              ),
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
