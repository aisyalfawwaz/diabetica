import 'package:diabetica/firebase_options.dart';
import 'package:diabetica/pages/DiabeticaOnboarding.dart';
import 'package:diabetica/pages/LoginPage.dart';
import 'package:diabetica/services/RealtimeDatabaseService.dart'; // Import RealtimeDatabaseService
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    RealtimeDatabaseServiceProvider(
      service: RealtimeDatabaseService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Bottom Bar Example',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiabeticaOnboarding(),
    );
  }
}
