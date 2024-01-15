import 'package:diabetica/models/FoodData.dart';
import 'package:flutter/material.dart';

class FoodRecommendationWidget extends StatelessWidget {
  final dynamic food;

  FoodRecommendationWidget({required this.food});

  @override
  Widget build(BuildContext context) {
    if (food == null) {
      return Container(); // atau widget default lainnya
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            food['name'],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 12),
          _buildCategorySection(),
          SizedBox(height: 16),
          _buildNutritionSection(),
          SizedBox(height: 16),
          Text(
            'Recommendation:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            food['recommendation'],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.category, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              food['category'],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNutritionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutrition:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        _buildNutritionItem(
            'Carbs',
            food['nutrition']['carbohydrates']?.toDouble() ?? 0,
            Icons.local_dining),
        _buildNutritionItem('Protein',
            food['nutrition']['protein']?.toDouble() ?? 0, Icons.sports_bar),
        _buildNutritionItem('Fat', food['nutrition']['fat']?.toDouble() ?? 0,
            Icons.local_pizza),
        _buildNutritionItem(
            'Fiber', food['nutrition']['fiber']?.toDouble() ?? 0, Icons.grass),
      ],
    );
  }

  Widget _buildNutritionItem(String label, double value, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.blue),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                '$value g',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
