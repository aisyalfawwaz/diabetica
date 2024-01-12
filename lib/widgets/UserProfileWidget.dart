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
                backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/D5603AQEa0JxS0W--zQ/profile-displayphoto-shrink_800_800/0/1690303844583?e=1710374400&v=beta&t=t8BSULhH6fQSYepG24lJxmca4ToWET6g4Z2RTeLZ_oA',
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aisy Al Fawwaz', // Replace with user's name
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '21 Years Old', // Replace with user's age
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
