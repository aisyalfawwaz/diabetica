import 'package:diabetica/widgets/DiabeticaCareFeature.dart';
import 'package:flutter/material.dart';

class DiabeticRiskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Card(
              color: Color.fromRGBO(22, 25, 27, 1),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Campaign Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Campaign Description. Get started now!',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Get Started" button pressed
                      },
                      child: Text('Get Started'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Adjust the spacing as needed
          ],
        ),
      ],
    );
  }
}
