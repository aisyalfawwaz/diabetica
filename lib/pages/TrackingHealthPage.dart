import 'package:diabetica/services/ApiService.dart';
import 'package:diabetica/widgets/TrackingHealthWidget.dart';
import 'package:flutter/material.dart';

class TrackingHealthPage extends StatefulWidget {
  @override
  _TrackingHealthPageState createState() => _TrackingHealthPageState();
}

class _TrackingHealthPageState extends State<TrackingHealthPage> {
  String bloodSugarValue = '';
  bool? bloodSugarType; // Nullable boolean for more flexibility
  String hba1c = '';
  String ketone = '';
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tracking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TrackingHealthWidget(
                title: 'Blood Sugar',
                unit: 'mg/dL',
                onValueChanged: (value, type) {
                  setState(() {
                    bloodSugarValue = value;
                    bloodSugarType = (type.toLowerCase() == 'true');
                  });
                },
              ),
              SizedBox(height: 16),
              TrackingHealthWidget(
                title: 'HbA1c',
                unit: '%',
                onValueChanged: (value, type) {
                  setState(() {
                    hba1c = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TrackingHealthWidget(
                title: 'Ketone',
                unit: 'mmol/L',
                onValueChanged: (value, type) {
                  setState(() {
                    ketone = value;
                  });
                },
              ),
              SizedBox(height: 16),
              _buildDateTimePicker(),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Check if bloodSugarType is not null and provide a default value if needed
                      ApiService.postHealthTrackingData(
                        bloodSugarValue: bloodSugarValue,
                        bloodSugarType: bloodSugarType ?? false,
                        hba1c: hba1c,
                        ketone: ketone,
                        selectedDateTime: selectedDateTime,
                      );
                      // Save the entered values
                      // You can use bloodSugarValue, bloodSugarType, hba1c, and ketone here
                      print('Blood Sugar Value: $bloodSugarValue');
                      print('Blood Sugar Type: $bloodSugarType');
                      print('HbA1c: $hba1c');
                      print('Ketone: $ketone');
                      print('Date and Time: $selectedDateTime');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date and Time:',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.event,
              size: 30,
              color: Colors.blue,
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () async {
                final DateTime? pickedDateTime = await showDatePicker(
                  context: context,
                  initialDate: selectedDateTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickedDateTime != null) {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                  );

                  if (pickedTime != null) {
                    setState(() {
                      selectedDateTime = DateTime(
                        pickedDateTime.year,
                        pickedDateTime.month,
                        pickedDateTime.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              '${_formatDateTime(selectedDateTime)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}
