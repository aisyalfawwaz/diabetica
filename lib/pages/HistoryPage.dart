import 'package:diabetica/models/DataPoint.dart';
import 'package:diabetica/widgets/MonthlyGlucoseBarChart.dart';
import 'package:diabetica/widgets/WeeklyGlucoseBarChart.dart';
import 'package:diabetica/widgets/GlucoseInfoCard.dart';
import 'package:diabetica/widgets/YearlyGlucoseBarChart.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle('Glucose History', Icons.history),
                _buildTabBar(),
                if (_currentIndex == 0) // Show GlucoseBarChart for weekly view
                  WeeklyGlucoseBarChart(glucoseData: glucoseData),
                if (_currentIndex == 1) // Show monthly view widget here
                  MonthlyGlucoseBarChart(glucoseData: glucoseData),
                if (_currentIndex == 2) // Show yearly view widget here
                  YearlyGlucoseBarChart(glucoseData: glucoseData),
                const SizedBox(height: 20),
                _buildSectionTitle('Last Glucose Information', Icons.info),
                const SizedBox(height: 10),
                const GlucoseInfoCard(
                  title: 'Glucose',
                  value: '130 mg/dL',
                ),
                const GlucoseInfoCard(
                  title: 'HbA1c',
                  value: '6.0%',
                ),
                const GlucoseInfoCard(
                  title: 'Keton',
                  value: 'Negative',
                ),
                const GlucoseInfoCard(
                  title: 'Diabetes Status',
                  value: 'Normal',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.blue,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('Weekly', 0),
          _buildTabItem('Monthly', 1),
          _buildTabItem('Yearly', 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _currentIndex == index ? Colors.blue : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _currentIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildYearlyWidget() {
    // Implement yearly view widget here
    return Container(
      height: 200,
      color: Colors.green,
      child: const Center(
        child: Text('Yearly View Widget'),
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
