class Statusmodel {
  final String imageURL;
  final String name;
  final DateTime timeAgo;

  const Statusmodel({required this.imageURL,required this.name,required this.timeAgo});


}

final List<Statusmodel> statuses=[
  Statusmodel(imageURL: "assets/images/download.jpeg", name: "Sam", timeAgo: DateTime.now()),
  Statusmodel(imageURL: "assets/images/modern-male-avatar-with-black-hair-and-hoodie-illustration-free-png.webp", name: "Anshu", timeAgo: DateTime.now())
];