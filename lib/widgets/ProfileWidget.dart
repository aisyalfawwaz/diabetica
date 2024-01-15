import 'package:diabetica/pages/HelpCenterPage.dart';
import 'package:diabetica/pages/PrivacyPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 21, 141, 240),
                radius: 50,
                backgroundImage: user != null && user.photoURL != null
                    ? NetworkImage(user.photoURL!)
                    : AssetImage('assets/placeholder_image.jpg')
                        as ImageProvider<Object>,
              ),
              const SizedBox(height: 20),
              Text(
                user?.displayName ?? '',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                user?.email ?? '',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
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
                  MaterialPageRoute(builder: (context) => const PrivacyPage()),
                ); // Handle menu item tap
              }),
              buildMenuCard('Help Center', Icons.help, Colors.purple, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HelpCenterPage()),
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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
