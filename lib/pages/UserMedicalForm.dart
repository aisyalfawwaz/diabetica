import 'package:diabetica/widgets/UserMedicalFormHealth.dart';
import 'package:diabetica/widgets/UserMedicalFormPersonal.dart';
import 'package:flutter/material.dart';

class UserMedicalForm extends StatefulWidget {
  @override
  _UserMedicalFormState createState() => _UserMedicalFormState();
}

class _UserMedicalFormState extends State<UserMedicalForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 36), // Tambahkan margin atas di sini
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: [
            UserMedicalFormPersonal(
              onNextPressed: () {
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            UserMedicalFormHealth(),
          ],
        ),
      ),
    );
  }
}
