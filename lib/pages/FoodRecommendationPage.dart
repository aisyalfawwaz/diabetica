import 'package:diabetica/models/FoodData.dart';
import 'package:diabetica/widgets/FoodRecommendationWidget.dart';
import 'package:flutter/material.dart';

class FoodRecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food & Nutrition Recommendation'),
      ),
      body: ListView.builder(
        itemCount: FoodData.foodRecommendations.length,
        itemBuilder: (context, index) {
          return FoodRecommendationWidget(
            food: FoodData.foodRecommendations[index],
          );
        },
      ),
    );
  }
}
