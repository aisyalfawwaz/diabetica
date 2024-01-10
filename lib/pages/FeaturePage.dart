import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Features'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              _buildFeature(
                icon: Icons.restaurant,
                title: 'Food & Nutrition Recommendations',
                description:
                    'Get personalized recommendations for food and nutrition.',
              ),
              SizedBox(height: 20),
              _buildFeature(
                icon: Icons.chat_bubble,
                title: 'Consultation',
                description:
                    'Connect with healthcare professionals for advice.',
              ),
              SizedBox(height: 20),
              _buildFeature(
                icon: Icons.warning,
                title: 'Diabetic Complication Detection',
                description:
                    'Identify potential complications related to diabetes.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 36,
                color: Colors.blue, // Adjust icon color as needed
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
