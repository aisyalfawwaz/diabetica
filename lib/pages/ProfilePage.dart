import 'package:diabetica/widgets/ProfileWidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ProfileWidget(),
      ),
    );
  }
}
