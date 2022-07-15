class Status {
  final String name, image, time;
  final bool isSeen;

  Status({
    this.name = '',
    this.image = '',
    this.time = '',
    this.isSeen = false,
  });
}

List statusData = [
  Status(
    name: "Jenny Wilson",
    image: "assets/images/mount1.jpg",
    time: "3m ago",
    isSeen: true,
  ),
  Status(
    name: "Esther Howard",
    image: "assets/images/sea1.jpg",
    time: "8m ago",
    isSeen: false,
  ),
  Status(
    name: "Ralph Edwards",
    image: "assets/images/mount2.jpg",
    time: "8h ago",
    isSeen: true,
  ),
  Status(
    name: "Jacob Jones",
    image: "assets/images/sea2.jpg",
    time: "12h ago",
    isSeen: false,
  ),
  Status(
    name: "Albert Flores",
    image: "assets/images/sea3.jpg",
    time: "19h ago",
    isSeen: false,
  ),
];
