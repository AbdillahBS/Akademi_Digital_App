import 'package:flutter/material.dart';
import 'package:imk_app/model/chatbox._model.dart';
import 'package:imk_app/views/chat.dart';

import 'package:imk_app/theme/apps_color.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Gen-Z",
              style: TextStyle(
                color: AppColors.textLight,
              ),
            ),
            Text(
              "Chatbox",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: dummyChatData.length,
                itemBuilder: (context, index) {
                  final chat = dummyChatData[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(chat.profileImageUrl),
                        radius: 25,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chat.name,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            chat.time,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chat.message,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              if (chat.unreadCount > 0)
                                CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  maxRadius: 12,
                                  child: Text(
                                    '${chat.unreadCount}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailPage(
                              name: chat.name,
                              profileImageUrl: chat.profileImageUrl,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
