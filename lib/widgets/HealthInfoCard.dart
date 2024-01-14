import 'package:flutter/material.dart';

class HealthInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const HealthInfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color numberColor;

    if (title == 'Heart Rate') {
      icon = Icons.favorite;
      numberColor = Colors.red;
    } else if (title == 'Diabetes Risk Value') {
      icon = Icons.info;
      numberColor = Colors.blue;
    } else {
      icon = Icons.accessibility;
      numberColor = Colors.green;
    }

    return GestureDetector(
      onTap: () {
        // Action when the card is tapped
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins', // Menggunakan font Poppins
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 24,
                          color: numberColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins', // Menggunakan font Poppins
                        ),
                      ),
                    ),
                    Icon(
                      icon,
                      color: numberColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
