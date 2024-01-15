import 'package:diabetica/widgets/ChatWidget.dart';
import 'package:flutter/material.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation'),
      ),
      body: const ChatWidget(),
    );
  }
}
