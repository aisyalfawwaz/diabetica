import 'package:diabetica/widgets/ProfileWidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              ProfileWidget(),
              // Tambahkan widget lainnya di sini jika diperlukan
            ],
          ),
        ),
      ),
    );
  }
}
