import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/basic_projects/widget/build_chat_item.dart';
import 'package:iti_projects/const.dart';

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
                itemBuilder: (context, index) => buildChatItem(
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



