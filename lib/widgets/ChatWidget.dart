import 'package:diabetica/services/RealtimeDatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      RealtimeDatabaseService().sendMessage(_messageController.text);
      _messageController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: RealtimeDatabaseService().messagesStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No messages available.'),
                  );
                }

                final messages = snapshot.data!;
                List<Widget> messageWidgets = messages
                    .map((message) {
                      try {
                        final String userImageUrl =
                            message['userImageUrl']?.toString() ?? '';
                        final String messageText =
                            message['message']?.toString() ?? '';
                        final String timestamp =
                            message['timestamp']?.toString() ?? '';

                        return Align(
                          alignment: message['userId'] == 'currentUserId'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: message['userId'] == 'currentUserId'
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(userImageUrl),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'Username', // Replace with the actual username
                                      style: TextStyle(
                                        color:
                                            message['userId'] == 'currentUserId'
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  messageText,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: message['userId'] == 'currentUserId'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      _formatTimestamp(timestamp),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } catch (e) {
                        print('Error processing message: $e');
                        return Container(); // Return an empty container or handle the error appropriately
                      }
                    })
                    .whereType<Widget>()
                    .toList();

                return ListView(
                  controller: _scrollController,
                  reverse: true,
                  children: messageWidgets,
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

  String _formatTimestamp(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp);
    return DateFormat.yMd().add_Hms().format(dateTime);
  }
}
