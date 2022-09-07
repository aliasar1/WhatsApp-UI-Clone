enum ChatMessageType { text, audio, image, video }

class ChatMessage {
  final String text, time;
  final String duration;
  final ChatMessageType messageType;
  final bool isSender;

  ChatMessage({
    this.text = '',
    this.time = '',
    this.duration = '',
    required this.messageType,
    required this.isSender,
  });
}

List chatMessagesData = [
  ChatMessage(
    text: "Sure!",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "I'll surely join you next time.",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:41",
    messageType: ChatMessageType.audio,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    isSender: false,
  ),
  ChatMessage(
    text: "This look mesmerizing.",
    time: "6:32 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "Watched sunset!",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:57 pm",
    messageType: ChatMessageType.image,
    isSender: false,
  ),
  ChatMessage(
    text: "Send me pictures.",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "You also went to beach?",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:29",
    messageType: ChatMessageType.audio,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:32 pm",
    messageType: ChatMessageType.image,
    isSender: true,
  ),
  ChatMessage(
    text: "Beutiful video.",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    isSender: true,
  ),
  ChatMessage(
    text: "Glad you like it.",
    time: "6:57 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "Oh wow!!",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "5000ft above sea level.",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:55",
    messageType: ChatMessageType.audio,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    isSender: true,
  ),
  ChatMessage(
    text: "Okay wait.",
    time: "6:32 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "Send me pictures and videos.",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "Yes I did.",
    time: "6:57 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "Sounds like you had  alot of fun.",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "Listen this..",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:22",
    messageType: ChatMessageType.audio,
    isSender: true,
  ),
  ChatMessage(
    text: "Did you enjoy your trip?",
    time: "6:25 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "I am great.",
    time: "6:32 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    text: "Hello. How are you?",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    text: "Hi! Ali Asar.",
    time: "6:57 pm",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
];
