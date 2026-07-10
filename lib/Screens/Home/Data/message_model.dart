class MessageModel {
  final int? id;
  final String senderId;
  final String receiverId;
  final String message;
  final String timestamp;
  final int status;

  MessageModel({
    this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "sender_id": senderId,
      "receiver_id": receiverId,
      "message": message,
      "timestamp": timestamp,
      "status": status,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map["id"],
      senderId: map["sender_id"],
      receiverId: map["receiver_id"],
      message: map["message"],
      timestamp: map["timestamp"],
      status: map["status"],
    );
  }
}
