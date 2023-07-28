class UserMessageModel {
  final String name;
  final String image;
  final MessageType messageType;
  final String message;
  final String createdAt;

  UserMessageModel({
    required this.name,
    required this.image,
    required this.message,
    required this.createdAt,
    required this.messageType,
  });
}






///Enum
enum MessageType {
  VIDEO,
  TEXT,
  GIF,
}
