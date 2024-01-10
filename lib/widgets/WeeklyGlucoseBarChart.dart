import 'package:diabetica/models/DataPoint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyGlucoseBarChart extends StatelessWidget {
  final List<DataPoint> glucoseData;

  const WeeklyGlucoseBarChart({required this.glucoseData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your onTap logic here
        // For example, navigate to a different screen or perform an action
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 2.0,
        color: Colors.white.withOpacity(0.7), // Adjust transparency here
        child: Container(
          height: 300,
          padding: EdgeInsets.all(8.0),
          child: SfCartesianChart(
            plotAreaBorderColor: Colors.transparent,
            primaryXAxis:
                CategoryAxis(), // Using CategoryAxis for days of the week
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
                xValueMapper: (DataPoint data, _) => DateFormat.E()
                    .format(data.date), // Format date to day of the week
                yValueMapper: (DataPoint data, _) => data.value,
                pointColorMapper: (DataPoint data, _) {
                  // Color each bar based on the day of the week
                  switch (DateFormat.E().format(data.date)) {
                    case 'Mon':
                      return Colors.blue;
                    case 'Tue':
                      return Colors.green;
                    case 'Wed':
                      return Colors.orange;
                    case 'Thu':
                      return Colors.red;
                    case 'Fri':
                      return Colors.purple;
                    case 'Sat':
                      return Colors.yellow;
                    case 'Sun':
                      return Colors.teal;
                    default:
                      return Colors.grey; // Fallback color
                  }
                },
                width: 0.8, // Adjust bar width
              ),
            ],
          ),
        ),
      ),
    );
  }
}
