import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _messages;

  FirestoreService() {
    _messages = _firestore.collection('messages');
  }

  Stream<List<String>> get messagesStream {
    return _messages.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc['text'] as String).toList();
    });
  }

  void sendMessage(String text) {
    _messages.add({'text': text});
  }
}
