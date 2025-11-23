class CallModel {
  final String name;
  final String imageURL;
  final DateTime time;
  final bool isVideoCall;
  final bool isIncoming;
  final bool isMissed;

  CallModel({
    required this.name,
    required this.imageURL,
    required this.time,
    required this.isVideoCall,
    required this.isIncoming,
    required this.isMissed,
  });
}

final List<CallModel> callList = [
  CallModel(
    name: "Martin Torff",
    imageURL: "assets/images/boy.avif",
    time: DateTime.now().subtract(Duration(minutes: 5)),
    isVideoCall: false,
    isIncoming: true,
    isMissed: true,
  ),
  CallModel(
    name: "Alfonso Rhiel Madsen",
    imageURL: "assets/images/boy.avif",
    time: DateTime.now().subtract(Duration(minutes: 7)),
    isVideoCall: false,
    isIncoming: false,
    isMissed: false,
  ),
  CallModel(
    name: "Carla Korsgaard",
    imageURL: "assets/images/girl.avif",
    time: DateTime.now().subtract(Duration(minutes: 10)),
    isVideoCall: false,
    isIncoming: false,
    isMissed: false,
  ),
  CallModel(
    name: "Cristofer Passaquindici Arcand",
    imageURL: "assets/images/girl.avif",
    time: DateTime.now().subtract(Duration(minutes: 12)),
    isVideoCall: true,
    isIncoming: true,
    isMissed: true,
  ),
  CallModel(
    name: "Zaire Passaquindici Arcand",
    imageURL: "assets/images/boy.avif",
    time: DateTime.now().subtract(Duration(minutes: 15)),
    isVideoCall: false,
    isIncoming: false,
    isMissed: false,
  ),
  CallModel(
    name: "Martin Dorwart",
    imageURL: "assets/images/boy.avif",
    time: DateTime.now().subtract(Duration(minutes: 16)),
    isVideoCall: false,
    isIncoming: false,
    isMissed: false,
  ),
  CallModel(
    name: "Phillip Westervelt",
    imageURL: "assets/images/girl.avif",
    time: DateTime.now().subtract(Duration(minutes: 18)),
    isVideoCall: false,
    isIncoming: false,
    isMissed: false,
  ),
  CallModel(
    name: "Terry Dokidis",
    imageURL: "assets/images/boy.avif",
    time: DateTime.now().subtract(Duration(minutes: 20)),
    isVideoCall: true,
    isIncoming: true,
    isMissed: true,
  ),
  CallModel(
    name: "Davis Westervelt",
    imageURL: "assets/images/boy.avif",
    time: DateTime.now().subtract(Duration(minutes: 25)),
    isVideoCall: false,
    isIncoming: false,
    isMissed: false,
  ),
];