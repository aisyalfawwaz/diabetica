import 'package:diabetica/widgets/DiabeticaCareCard.dart';
import 'package:diabetica/widgets/DiabeticaCareListView.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/widgets/UserProfileWidget.dart';
import 'package:diabetica/widgets/EmoticonButton.dart';
import 'package:diabetica/widgets/DiabeticRiskCard.dart';
import 'package:diabetica/widgets/WeeklyGlucoseBarChart.dart';
import 'package:diabetica/widgets/MonthlyGlucoseBarChart.dart';
import 'package:diabetica/widgets/YearlyGlucoseBarChart.dart';
import 'package:diabetica/models/DataPoint.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DataPoint> glucoseData;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    glucoseData = _getGlucoseData();
  }

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
                      EmoticonButton(
                          icon: Icons.sentiment_satisfied,
                          iconColor: Colors.green),
                      EmoticonButton(
                          icon: Icons.sentiment_neutral,
                          iconColor: Colors.yellow),
                      EmoticonButton(
                          icon: Icons.sentiment_dissatisfied,
                          iconColor: Colors.red),
                    ],
                  ),
                  SizedBox(height: 10),
                  DiabeticRiskCard(),
                  DiabeticaCareCard(
                    currentIndex: _currentIndex,
                    onTabChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    glucoseData: glucoseData,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'How to boost your health ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DiabeticaCareListView()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataPoint> _getGlucoseData() {
    return List.generate(
      20,
      (index) => DataPoint(
        DateTime.now().subtract(Duration(days: index)),
        (index * 5).toDouble(),
      ),
    );
  }
}
