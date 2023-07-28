import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/basic_projects/model/user_message_model.dart';
import 'package:iti_projects/basic_projects/widget/build_chat_item.dart';
import 'package:iti_projects/const.dart';


class MessangerChatsScreen extends StatelessWidget {
  MessangerChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _searchField(),
              Container(
                height: 40,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemBuilder: (context, index) => _buildAvatar(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context,index)=>SizedBox(height: 20,),
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

  Widget _buildAvatar() {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(image1),
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 5,
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            label: const Text("Search"),
            prefixIcon: const Icon(CupertinoIcons.search),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: CircleAvatar(
          radius: 8,
          backgroundImage: NetworkImage(image1),
        ),
      ),
      title: const Text(
        "Chat",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        _actionIcon(CupertinoIcons.camera_fill),
        _actionIcon(CupertinoIcons.app_badge),
      ],
    );
  }

  Widget _actionIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        radius: 16,
        child: Icon(
          icon,
          size: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
