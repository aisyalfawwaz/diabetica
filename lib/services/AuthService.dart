import 'package:diabetica/pages/LoginPage.dart';
import 'package:diabetica/pages/RegisterPage.dart';
import 'package:diabetica/pages/UserMedicalForm.dart';
import 'package:diabetica/services/ApiService.dart';
import 'package:diabetica/services/SharedPreferences.dart';
import 'package:diabetica/widgets/CustomBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<String?> getCurrentUID() async {
    return currentUser?.uid;
  }

  Future<bool> isUserRegistered(String email) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email, password: 'password_placeholder');
      return userCredential.user != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> signIn(
    BuildContext context,
    String email,
    String password,
    Function(String) onErrorCallback,
  ) async {
    bool userRegistered = await isUserRegistered(email);

    if (userRegistered) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          // Panggil API untuk mendapatkan detail pengguna
          Map<String, dynamic> userDetails =
              await ApiService.getUserDetails(userCredential.user!.uid);

          // Periksa apakah data pengguna tersedia dalam respon API
          if (userDetails.containsKey('data')) {
            Map<String, dynamic> userData = userDetails['data'];

            // Periksa apakah userId sesuai
            if (userData.containsKey('userid') &&
                userData['userid'] == userCredential.user!.uid) {
              await saveSession(userCredential.user!.uid);

              // Jika userId sesuai, pindahkan ke CustomBottomBar
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CustomBottomBar()),
              );
            } else {
              // Jika userId tidak sesuai, pindahkan ke UserMedicalForm
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserMedicalForm()),
              );
            }
          }
        }
      } on FirebaseAuthException catch (e) {
        // Tangani kesalahan login
        onErrorCallback('Sign-in failed. ${e.message}');
      }
    } else {
      onErrorCallback('User not registered. Please register first.');
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          // Panggil API untuk mendapatkan detail pengguna
          Map<String, dynamic> userDetails =
              await ApiService.getUserDetails(userCredential.user!.uid);

          // Periksa apakah data pengguna tersedia dalam respon API
          if (userDetails.containsKey('data')) {
            Map<String, dynamic> userData = userDetails['data'];

            // Periksa apakah userId sesuai
            if (userData.containsKey('userid') &&
                userData['userid'] == userCredential.user!.uid) {
              await saveSession(userCredential.user!.uid);

              // Jika userId sesuai, pindahkan ke CustomBottomBar
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CustomBottomBar()),
              );
            } else {
              // Jika userId tidak sesuai, pindahkan ke UserMedicalForm
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserMedicalForm()),
              );
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // Hapus sesi dari SharedPreferences
      await clearSession();

      // Pindahkan ke halaman login atau halaman lain yang sesuai
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print('Error during sign out: $e');
      // Handle error during sign out
    }
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_id');
  }

  void register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  // Metode untuk menampilkan snackbar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
