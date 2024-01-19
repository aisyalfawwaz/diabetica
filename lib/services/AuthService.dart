import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<bool> isUserRegistered(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
    bool userRegistered = await isUserRegistered(email, password);

    if (userRegistered) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          // Check if there is a corresponding document in the "medicaldata" collection
          bool hasMedicalData =
              await checkMedicalData(userCredential.user!.uid);

          if (hasMedicalData) {
            await saveSession(userCredential.user!.uid);

            // If medical data exists, navigate to CustomBottomBar
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CustomBottomBar()),
            );
          } else {
            // If no medical data exists, navigate to UserMedicalForm
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserMedicalForm()),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        // Handle FirebaseAuthException (e.g., incorrect password, user not found)
        onErrorCallback('Sign-in failed. ${e.message}');
      } catch (e, stackTrace) {
        // Handle other exceptions
        print('Error during sign-in: $e\n$stackTrace');
        // Handle other exceptions as needed
        // ...
      }
    } else {
      onErrorCallback('User not registered. Please register first.');
    }
  }

  Future<bool> checkMedicalData(String userId) async {
    try {
      // Lakukan pengecekan pada Firestore
      QuerySnapshot medicalDataQuery = await FirebaseFirestore.instance
          .collection('medicaldata')
          .where('UserID', isEqualTo: userId)
          .limit(1) // Limit 1, karena kita hanya perlu satu dokumen (jika ada)
          .get();

      // Return true jika ada dokumen, false jika tidak
      return medicalDataQuery.size > 0;
    } catch (e) {
      print('Error checking medical data: $e');
      return false; // Return false jika terjadi kesalahan
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
          // Check if there is a corresponding document in the "medicaldata" collection
          bool hasMedicalData =
              await checkMedicalData(userCredential.user!.uid);

          if (hasMedicalData) {
            await saveSession(userCredential.user!.uid);

            // If medical data exists, navigate to CustomBottomBar
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CustomBottomBar()),
            );
          } else {
            // If no medical data exists, navigate to UserMedicalForm
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserMedicalForm()),
            );
          }
        }
      }
    } catch (e) {
      print(e);
      // Handle errors (e.g., Google Sign-In error)
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      // Sign out the current Google user (if any)
      await GoogleSignIn().signOut();

      // Sign out from FirebaseAuth
      await FirebaseAuth.instance.signOut();

      // Clear session from SharedPreferences
      await clearSession();

      // Navigate to the login page or another appropriate page
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
