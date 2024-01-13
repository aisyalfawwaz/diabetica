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

  Stream<List<Map<String, dynamic>>> get messagesStreamWithUserData {
    return _messages
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'userName': doc['userName'] ?? '',
          'userImageUrl': doc['userImageUrl'] ?? '',
          'message': doc['text'] as String,
          'timestamp': doc['timestamp'] ?? Timestamp.now(),
        };
      }).toList();
    });
  }

  void sendMessage(String text) {
    _messages.add({'text': text, 'timestamp': Timestamp.now()});
  }

  void sendMessageWithUserData(
      String text, String userName, String userImageUrl) {
    _messages.add({
      'text': text,
      'userName': userName,
      'userImageUrl': userImageUrl,
      'timestamp': Timestamp.now(),
    });
  }
}
