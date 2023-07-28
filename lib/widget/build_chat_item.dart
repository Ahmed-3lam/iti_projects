import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/model/user_message_model.dart';

Widget buildChatItem({
  required String name,
  required String myImage,
  required String message,
  required String time,
  required MessageType messageType,
}) {
  return  Row(
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