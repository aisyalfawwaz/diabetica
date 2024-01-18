import 'package:diabetica/widgets/UserMedicalFormHealth.dart';
import 'package:diabetica/widgets/UserMedicalFormPersonal.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/services/AuthService.dart'; // Import your AuthService

class UserMedicalForm extends StatefulWidget {
  @override
  _UserMedicalFormState createState() => _UserMedicalFormState();
}

class _UserMedicalFormState extends State<UserMedicalForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  AuthService authService = AuthService(); // Create an instance of AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 36), // Add top margin here
        child: FutureBuilder<String?>(
          // Use FutureBuilder to get the UID asynchronously
          future: authService.getCurrentUID(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading indicator while waiting for the UID
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // If UID is available, pass it to UserMedicalFormCombined
              return PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  UserMedicalFormCombined(
                    uid: snapshot.data ?? '', // Pass UID here
                  ),
                  // UserMedicalFormHealth(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
