import 'package:diabetica/widgets/DiabetesConfirmationDialog.dart';
import 'package:diabetica/widgets/DiabetesQuestionWidget.dart';
import 'package:flutter/material.dart';
import 'UserMedicalForm.dart';

class DiabetesQuestionPage extends StatefulWidget {
  @override
  _DiabetesQuestionPageState createState() => _DiabetesQuestionPageState();
}

class _DiabetesQuestionPageState extends State<DiabetesQuestionPage> {
  String _selectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue, // Warna latar belakang
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiabetesQuestionWidget(
                onAnswerSelected: _showConfirmationDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(String answer) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DiabetesConfirmationDialog(
          answer: answer,
          onConfirmation: _handleConfirmation,
        );
      },
    );
  }

  void _handleConfirmation(String answer) {
    // Perform actions after confirmation
    if (answer == 'Yes') {
      // Navigate to the next page (UserMedicalForm)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserMedicalForm()),
      );
    } else if (answer == 'No') {
      // Handle case when answer is 'No'
    } else {
      // Handle case when answer is 'Don't know'
    }
  }
}
