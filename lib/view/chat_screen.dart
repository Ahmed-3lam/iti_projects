import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../model/user_message_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
        onPressed: () {},
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCustomChats(
                  icon: Icons.lock, text: "Locked Chats", messagesCount: 0),
              const SizedBox(
                height: 30,
              ),
              _buildCustomChats(
                  icon: Icons.archive, text: "Archive", messagesCount: 20),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: messagesList.length,
                itemBuilder: (context, index) => _buildChatItem(
                  name: messagesList[index].name,
                  message: messagesList[index].message,
                  time: messagesList[index].createdAt,
                  myImage: messagesList[index].image,
                  messageType: messagesList[index].messageType,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String myImage,
    required String message,
    required String time,
    required MessageType messageType,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(myImage),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _messageTypeText(message, messageType)
              ],
            ),
            const Spacer(),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _messageTypeText(String message, MessageType messageType) {
    ///text
    if (messageType == MessageType.TEXT) {
      return Text(
        message,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    } else if (messageType == MessageType.VIDEO) {
      return Row(
        children: [
          Icon(
            CupertinoIcons.video_camera_solid,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Video",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(
            CupertinoIcons.gift,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "GIF",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildCustomChats({
    required IconData icon,
    required String text,
    required int messagesCount,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        if (messagesCount != 0)
          Text(
            messagesCount.toString(),
            style: const TextStyle(
              color: Colors.green,
              fontSize: 12,
            ),
          ),
      ],
    );
  }

  List<UserMessageModel> messagesList = [
    UserMessageModel(
      name: "Ahmed",
      message: " ggffg",
      image: image1,
      createdAt: "03:49",
      messageType: MessageType.TEXT,
    ),
    UserMessageModel(
      name: "Mohamed",
      message: "I'm Happy",
      image: image2,
      createdAt: "05:49",
      messageType: MessageType.VIDEO,
    ),
    UserMessageModel(
      name: "Adel",
      message: "I'm Happy",
      image: image1,
      createdAt: "08:49",
      messageType: MessageType.GIF,
    ),
    UserMessageModel(
      name: "Eman",
      message: "I'm Happy",
      image: image2,
      createdAt: "11:49",
      messageType: MessageType.GIF,
    ),
    UserMessageModel(
      name: "Yossra",
      message: "I'm Happy",
      image: image1,
      createdAt: "11:49",
      messageType: MessageType.GIF,
    ),
    UserMessageModel(
      name: "kjjkjkjk",
      message: "I'm Happy",
      image: image2,
      createdAt: "11:49",
      messageType: MessageType.VIDEO,
    ),
    UserMessageModel(
      name: "Ahmed",
      message: "I'm Happy",
      image: image1,
      createdAt: "11:49",
      messageType: MessageType.TEXT,
    ),

    UserMessageModel(
      name: "Ahmed",
      message: " ggffg",
      image: image1,
      createdAt: "03:49",
      messageType: MessageType.TEXT,
    ),
    UserMessageModel(
      name: "Mohamed",
      message: "I'm Happy",
      image: image2,
      createdAt: "05:49",
      messageType: MessageType.VIDEO,
    ),
    UserMessageModel(
      name: "Adel",
      message: "I'm Happy",
      image: image1,
      createdAt: "08:49",
      messageType: MessageType.GIF,
    ),
    UserMessageModel(
      name: "Eman",
      message: "I'm Happy",
      image: image2,
      createdAt: "11:49",
      messageType: MessageType.GIF,
    ),
    UserMessageModel(
      name: "Yossra",
      message: "I'm Happy",
      image: image1,
      createdAt: "11:49",
      messageType: MessageType.GIF,
    ),
    UserMessageModel(
      name: "kjjkjkjk",
      message: "I'm Happy",
      image: image2,
      createdAt: "11:49",
      messageType: MessageType.VIDEO,
    ),
    UserMessageModel(
      name: "Ahmed",
      message: "I'm Happy",
      image: image1,
      createdAt: "11:49",
      messageType: MessageType.TEXT,
    ),
  ];
}
