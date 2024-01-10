import 'package:flutter/material.dart';
import 'package:diabetica/widgets/FeaturesWidget.dart';
import 'package:diabetica/widgets/HealthInfoCard.dart';
import 'package:diabetica/widgets/HorizontalListView.dart';
import 'package:diabetica/widgets/UserProfileWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileWidget(),
              SizedBox(height: 20),
              HorizontalListView(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: HealthInfoCard(
                      title: 'Heart Rate',
                      value: '80 bpm',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: HealthInfoCard(
                      title: 'Diabetes Risk Value',
                      value: 'Low',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FeaturesWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
