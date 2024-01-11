import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                // Add user profile image here
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe', // Replace with user's name
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Age: 30', // Replace with user's age
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        Card(
          color: Color.fromARGB(242, 246, 249, 249),
          elevation: 1.0,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification button pressed
              },
            ),
          ),
        ),
      ],
    );
  }
}
