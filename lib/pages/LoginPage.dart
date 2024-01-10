import 'package:diabetica/widgets/LoginForm.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: LoginForm(), // Gunakan widget LoginForm di sini
    );
  }
}
