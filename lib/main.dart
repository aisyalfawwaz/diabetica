import 'package:diabetica/firebase_options.dart';
import 'package:diabetica/pages/DiabeticaOnboarding.dart';
import 'package:diabetica/services/RealtimeDatabaseService.dart'; // Import RealtimeDatabaseService
import 'package:diabetica/widgets/CustomBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Cek sesi pengguna di sini
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('user_id');
  Widget initialWidget;

  if (userId != null) {
    // Jika sesi ditemukan, arahkan ke halaman yang sesuai
    initialWidget = CustomBottomBar();
  } else {
    // Jika sesi tidak ditemukan, arahkan ke halaman onboarding atau halaman awal yang sesuai
    initialWidget = DiabeticaOnboarding();
  }

  runApp(
    RealtimeDatabaseServiceProvider(
      service: RealtimeDatabaseService(),
      child: MaterialApp(
        title: 'Custom Bottom Bar Example',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: initialWidget,
      ),
    ),
  );
}
