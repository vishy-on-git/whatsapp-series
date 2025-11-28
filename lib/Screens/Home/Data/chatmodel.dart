class Chatmodel {
  final String text;
  final DateTime time;
  final String? image;
  final int count;
  final String contactName;

  Chatmodel({
    required this.text,
    required this.time,
    this.image,
    required this.count,
    required this.contactName
  });
}

final List<Chatmodel> chats = [
  Chatmodel(text: "Hey Buddy", time: DateTime.now(), count: 8,contactName: "Anshu"),
  Chatmodel(text: "Kya kar rha hai?", time: DateTime.now(), image: "assets/images/884ee94fab54c221bc7c33c7ba7fa73fb85a491b.jpg",count: 2,contactName: "Tamojita"),
];
