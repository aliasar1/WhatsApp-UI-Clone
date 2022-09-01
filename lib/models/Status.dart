class Status {
  final String name, image, time, profile;
  final bool isSeen;

  Status({
    this.name = '',
    this.image = '',
    this.time = '',
    this.isSeen = false,
    this.profile = '',
  });
}

List statusData = [
  Status(
    name: "John Wilson",
    image: "assets/images/mount1.jpg",
    time: "3m ago",
    isSeen: true,
    profile: "assets/images/user1.jpg",
  ),
  Status(
    name: "Amy Howard",
    image: "assets/images/sea1.jpg",
    time: "8m ago",
    isSeen: false,
    profile: "assets/images/user4.jpg",
  ),
  Status(
    name: "Edward Ray",
    image: "assets/images/mount2.jpg",
    time: "8h ago",
    isSeen: true,
    profile: "assets/images/user2.jpg",
  ),
  Status(
    name: "Jacob Jones",
    image: "assets/images/sea2.jpeg",
    time: "12h ago",
    isSeen: false,
    profile: "assets/images/user3.jpg",
  ),
  Status(
    name: "Albert Flores",
    image: "assets/images/sea3.jpeg",
    time: "19h ago",
    isSeen: false,
    profile: "assets/images/user5.jpg",
  ),
];
