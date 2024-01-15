import 'package:flutter/material.dart';

class DiabetesQuestionWidget extends StatelessWidget {
  final Function(String) onAnswerSelected;

  DiabetesQuestionWidget({required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Hero(
            tag: 'heartIcon',
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Are you a diabetic patient?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        _buildAnswerButton('Yes', Icons.check, Colors.green),
        _buildAnswerButton('No', Icons.clear, Colors.red),
        _buildAnswerButton("Don't know", Icons.help, Colors.orange),
      ],
    );
  }

  Widget _buildAnswerButton(String answer, IconData icon, Color buttonColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          onAnswerSelected(answer);
        },
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              answer,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
