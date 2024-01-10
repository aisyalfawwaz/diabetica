import 'package:diabetica/models/DataPoint.dart';
import 'package:diabetica/widgets/GlucoseInfoCard.dart';
import 'package:diabetica/widgets/GlucoseBarChart.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DataPoint> glucoseData = _getGlucoseData();

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle('Glucose History', Icons.history),
                GlucoseBarChart(glucoseData: glucoseData),
                SizedBox(height: 20),
                _buildSectionTitle('Last Glucose Information', Icons.info),
                SizedBox(height: 10),
                GlucoseInfoCard(
                  title: 'Glucose',
                  value: '130 mg/dL',
                ),
                GlucoseInfoCard(
                  title: 'HbA1c',
                  value: '6.0%',
                ),
                GlucoseInfoCard(
                  title: 'Keton',
                  value: 'Negative',
                ),
                GlucoseInfoCard(
                  title: 'Diabetes Status',
                  value: 'Normal',
                ),
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
          color: Colors.blue, // Change the color as needed
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
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
