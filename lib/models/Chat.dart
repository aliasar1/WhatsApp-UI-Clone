class Chat {
  final String name, lastMessage, image, time;
  final bool isActive, isSeen;
  final int msgTotal;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
    this.isSeen = false,
    this.msgTotal = 0,
  });
}

List chatsData = [
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well.",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: true,
    isSeen: false,
    msgTotal: 0,
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Ali!",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: false,
    isSeen: true,
    msgTotal: 3,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update about the project?",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: true,
    isSeen: false,
    msgTotal: 0,
  ),
  Chat(
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 2,
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 1,
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Kindly let me know when you are free.",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
    isSeen: true,
    msgTotal: 0,
  ),
  Chat(
    name: "Usama Khan",
    lastMessage: "Hello! Ali here.",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    isSeen: false,
    msgTotal: 0,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do remind me about the meeting.",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    isSeen: true,
    msgTotal: 1,
  ),
];
