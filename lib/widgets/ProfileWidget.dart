import 'package:diabetica/pages/HelpCenterPage.dart';
import 'package:diabetica/pages/PrivacyPage.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 21, 141, 240),
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/D5603AQEa0JxS0W--zQ/profile-displayphoto-shrink_800_800/0/1690303844583?e=1710374400&v=beta&t=t8BSULhH6fQSYepG24lJxmca4ToWET6g4Z2RTeLZ_oA',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Aisy Al Fawwaz',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                '21 Tahun',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Menu Card Widgets
              buildMenuCard('User Details', Icons.person, Colors.blue, () {
                // Handle menu item tap
              }),
              buildMenuCard('Edit Profile', Icons.edit, Colors.orange, () {
                // Handle menu item tap
              }),
              buildMenuCard('Privacy', Icons.lock, Colors.green, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPage()),
                ); // Handle menu item tap
              }),
              buildMenuCard('Help Center', Icons.help, Colors.purple, () {
                // Navigasi ke halaman Help Center
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterPage()),
                );
              }),
              buildMenuCard('Sign Out', Icons.exit_to_app, Colors.red, () {
                // Handle menu item tap
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuCard(
      String title, IconData icon, Color cardColor, VoidCallback onTap) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
