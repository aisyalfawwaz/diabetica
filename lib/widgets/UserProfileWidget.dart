import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  int notificationCount = 9; // Replace with the actual notification count

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return user != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: user.photoURL != null
                          ? NetworkImage(user.photoURL!)
                          : AssetImage('assets/placeholder_image.jpg')
                              as ImageProvider<
                                  Object>, // Add 'as ImageProvider<Object>' to resolve the type issue
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.displayName ??
                            '', // Replace with the appropriate username
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email ??
                            '', // Replace with the appropriate profile information
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
          )
        : Container(); // Add an action if the user is not logged in or display another widget as needed
  }
}
