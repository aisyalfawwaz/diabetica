import 'package:diabetica/services/FirestoreServices.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      FirestoreService().sendMessageWithUserData(
        _messageController.text,
        'User Name', // Ganti dengan username user
        'User Image URL', // Ganti dengan URL gambar profil user
      );
      _messageController.clear();
    }
  }

  void _sendImage() {
    // Tambahkan logika untuk mengirim gambar
    // Anda dapat menggunakan plugin seperti image_picker untuk mengambil gambar
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: FirestoreService().messagesStreamWithUserData,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final messages = snapshot.data!;
                List<Widget> messageWidgets = messages
                    .map((message) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(message['userImageUrl']),
                                ),
                                title: Text(
                                  message['userName'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  message['message'],
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                trailing: Text(
                                  message['timestamp'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ))
                    .toList();

                return ListView(
                  reverse: true,
                  children: messageWidgets.reversed.toList(),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                icon: const Icon(Icons.photo),
                onPressed: _sendImage,
              ),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  onPressed: _sendMessage,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
