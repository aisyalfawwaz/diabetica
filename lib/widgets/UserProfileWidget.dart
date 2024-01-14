import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    int notificationCount =
        9; // Gantilah dengan jumlah notifikasi yang sebenarnya

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
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
                  'Aisy Al Fawwaz', // Ganti dengan nama pengguna
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '21 Years Old', // Ganti dengan usia pengguna
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -5, end: -1),
          badgeContent: Text(
            notificationCount.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button pressed
            },
          ),
        ),
      ],
    );
  }
}
