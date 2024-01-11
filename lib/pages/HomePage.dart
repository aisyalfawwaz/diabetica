import 'package:diabetica/pages/MenuBottomSheet.dart';
import 'package:diabetica/widgets/DiabeticRiskCalculatorCard.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/widgets/DiabeticRiskCard.dart';
import 'package:diabetica/widgets/DiabeticaCareFeature.dart';
import 'package:diabetica/widgets/EmoticonButton.dart';
import 'package:diabetica/widgets/UserProfileWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 30),
                  UserProfileWidget(),
                  SizedBox(height: 20),
                  Text(
                    'How do you exercise today?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      EmoticonButton(icon: Icons.sentiment_satisfied),
                      EmoticonButton(icon: Icons.sentiment_neutral),
                      EmoticonButton(icon: Icons.sentiment_dissatisfied),
                    ],
                  ),
                  // DiabeticRiskCard(),
                  DiabeticRiskCalculatorCard(
                      icon: Icons.access_alarm, riskValue: 99)
                  // DiabeticaCareWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
