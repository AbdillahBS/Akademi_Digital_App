import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatDetailPage extends StatelessWidget {
  final String name;
  final String profileImageUrl;

  ChatDetailPage({required this.name, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        // elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(width: 10),
            Text(name, style: GoogleFonts.roboto()),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: dummyMessages.length,
              itemBuilder: (context, index) {
                final message = dummyMessages[index];
                return Align(
                  alignment: message.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message.isMe ? Colors.orange : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                          color: message.isMe ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file), // Icon for attaching files
                  color: Colors.black,
                  onPressed: () {
                    // Add your logic for attaching files here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.orange,
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Message sent",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

List<ChatMessage> dummyMessages = [
  ChatMessage(text: 'Hi there!', isMe: true),
  ChatMessage(text: 'Hello! How can I help you?', isMe: false),
  ChatMessage(text: 'I have a question about my order.', isMe: true),
  ChatMessage(text: 'Sure, I\'d be happy to help.', isMe: false),
];
