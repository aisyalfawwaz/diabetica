import 'package:diabetica/models/DataPoint.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class YearlyGlucoseBarChart extends StatelessWidget {
  final List<DataPoint> glucoseData;

  const YearlyGlucoseBarChart({required this.glucoseData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 2.0,
      color: Colors.white.withOpacity(0.7), // Adjust transparency here
      child: Container(
        height: 300,
        padding: EdgeInsets.all(8.0),
        child: SfCartesianChart(
          plotAreaBorderColor: Colors.transparent,
          primaryXAxis: CategoryAxis(), // Using CategoryAxis for years
          primaryYAxis: NumericAxis(
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
            labelFormat: '{value} mg/dL',
            interval: 70,
            labelStyle: TextStyle(fontSize: 10), // Adjust font size here
          ),
          series: <ChartSeries>[
            // Using BarSeries to display glucose data as bars
            BarSeries<DataPoint, String>(
              dataSource: glucoseData,
              xValueMapper: (DataPoint data, _) =>
                  DateFormat.y().format(data.date), // Format date to year
              yValueMapper: (DataPoint data, _) => data.value,
              pointColorMapper: (DataPoint data, _) {
                // Color each bar based on the year
                int year = data.date.year;
                if (year == DateTime.now().year) {
                  return Colors.blue;
                } else if (year == DateTime.now().year - 1) {
                  return Colors.green;
                }
                return Colors.orange; // Fallback color
              },
              width: 0.8, // Adjust bar width
            ),
          ],
        ),
      ),
    );
  }
}
