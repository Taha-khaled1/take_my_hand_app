class Message {
  final int id;
  String? message;
  final bool isSentByMe;
  final String time;
  Message({
    required this.id,
    required this.message,
    required this.isSentByMe,
    required this.time,
  });
}
