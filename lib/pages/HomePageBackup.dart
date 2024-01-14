import 'package:diabetica/widgets/DiabeticRiskCalculatorCard.dart';
import 'package:diabetica/widgets/DiabeticaCareListView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DiabeticRiskCalculatorCard(
                icon: Icons.dangerous,
                riskValue: 70,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 4, 72, 16),
                        size: 28,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Diabetica Care',
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 72, 16),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Action to view all
                    },
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const DiabeticaCareListView(),
            ],
          ),
        ),
      ),
    );
  }
}
