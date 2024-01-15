import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseService {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('messages');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> get messagesStream {
    return _messagesRef.onValue.map((event) {
      final List<Map<String, dynamic>> messages = [];

      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;

        data?.forEach((key, value) {
          final Map<String, dynamic> messageData = {
            'message': value['message'] ?? '',
            'userImageUrl': value['userImageUrl'] ?? '',
            'timestamp': value['timestamp'] ?? '',
          };
          messages.add(messageData);
        });
      }

      return messages;
    });
  }

  void sendMessage(String message) async {
    User? user = _auth.currentUser;

    if (user != null) {
      final timestamp = DateTime.now().toUtc().toIso8601String();

      // Get the user's profile image URL
      String? userImageUrl = user.photoURL;

      await _messagesRef.push().set({
        'userId': user.uid,
        'message': message,
        'timestamp': timestamp,
        'userImageUrl': userImageUrl,
      });
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class RealtimeDatabaseServiceProvider extends InheritedWidget {
  final RealtimeDatabaseService service;

  RealtimeDatabaseServiceProvider({
    Key? key,
    required Widget child,
    required this.service,
  }) : super(key: key, child: child);

  static RealtimeDatabaseService of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<RealtimeDatabaseServiceProvider>();
    assert(provider != null,
        'No RealtimeDatabaseServiceProvider found in context');
    return provider!.service;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
