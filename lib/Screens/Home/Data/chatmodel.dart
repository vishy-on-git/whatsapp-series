class Chatmodel {
  final String text;
  final DateTime time;
  final String? image;
  final int count;

  Chatmodel({
    required this.text,
    required this.time,
    this.image,
    required this.count,
  });
}

final List<Chatmodel> chats = [
  Chatmodel(text: "Hey Buddy", time: DateTime.now(), count: 8),
  Chatmodel(text: "Kya kar rha hai?", time: DateTime.now(), count: 2),
];
