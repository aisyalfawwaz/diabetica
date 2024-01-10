import 'package:flutter/material.dart';

class GlucoseInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const GlucoseInfoCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (title.toLowerCase()) {
      case 'glucose':
        icon = Icons.favorite; // Replace with your desired icon
        break;
      case 'hba1c':
        icon = Icons.assessment; // Replace with your desired icon
        break;
      case 'keton':
        icon = Icons.local_hospital; // Replace with your desired icon
        break;
      case 'diabetic status':
        icon = Icons.healing; // Replace with your desired icon
        break;
      case 'detection date':
        icon = Icons.calendar_today; // Replace with your desired icon
        break;
      default:
        icon = Icons.info; // Default icon if not matched
        break;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: Colors.blue, // Change icon color as needed
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      value,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios), // Optional: Add navigation arrow
          ],
        ),
      ),
    );
  }
}
