import 'package:diabetica/widgets/ChartWidget.dart';
import 'package:flutter/material.dart';

class ConsultationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation'),
      ),
      body: ChatWidget(),
    );
  }
}
