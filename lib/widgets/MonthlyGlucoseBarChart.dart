import 'package:diabetica/models/DataPoint.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MonthlyGlucoseBarChart extends StatelessWidget {
  final List<DataPoint> glucoseData;

  const MonthlyGlucoseBarChart({super.key, required this.glucoseData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2.0,
      color: Colors.white.withOpacity(0.7), // Adjust transparency here
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          plotAreaBorderColor: Colors.transparent,
          primaryXAxis: CategoryAxis(), // Using CategoryAxis for months
          primaryYAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            labelFormat: '{value} mg/dL',
            interval: 70,
            labelStyle: const TextStyle(fontSize: 10), // Adjust font size here
          ),
          series: <ChartSeries>[
            // Using BarSeries to display glucose data as bars
            BarSeries<DataPoint, String>(
              dataSource: glucoseData,
              xValueMapper: (DataPoint data, _) =>
                  DateFormat.MMM().format(data.date), // Format date to month
              yValueMapper: (DataPoint data, _) => data.value,
              pointColorMapper: (DataPoint data, _) {
                // Color each bar based on the month
                int month = data.date.month;
                if (month == DateTime.january) {
                  return Colors.blue;
                } else if (month == DateTime.february) {
                  return Colors.green;
                } else if (month == DateTime.march) {
                  return Colors.orange;
                } else if (month == DateTime.april) {
                  return Colors.red;
                } else if (month == DateTime.may) {
                  return Colors.purple;
                } else if (month == DateTime.june) {
                  return Colors.yellow;
                } else if (month == DateTime.july) {
                  return Colors.teal;
                } else if (month == DateTime.august) {
                  return Colors.grey;
                } else if (month == DateTime.september) {
                  return Colors.cyan;
                } else if (month == DateTime.october) {
                  return Colors.indigo;
                } else if (month == DateTime.november) {
                  return Colors.amber;
                } else if (month == DateTime.december) {
                  return Colors.brown;
                }
                return Colors.black; // Fallback color
              },
              width: 0.8, // Adjust bar width
            ),
          ],
        ),
      ),
    );
  }
}
