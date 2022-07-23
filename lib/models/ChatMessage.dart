enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text, time;
  final String duration;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text = '',
    this.time = '',
    this.duration = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List chatMessagesData = [
  ChatMessage(
    text: "Hi Sajol,",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:41",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Error happend",
    time: "6:32 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:57 pm",
    messageType: ChatMessageType.image,
    messageStatus: MessageStatus.not_view,
    isSender: false,
  ),
  ChatMessage(
    text: "Hi Sajol,",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:29",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:32 pm",
    messageType: ChatMessageType.image,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    time: "6:57 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
  ChatMessage(
    text: "Hi Sajol,",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:55",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Error happend",
    time: "6:32 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    time: "6:57 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
  ChatMessage(
    text: "Hi Sajol,",
    time: "6:12 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    time: "6:16 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:18 pm",
    duration: "0:22",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    time: "6:25 pm",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Error happend",
    time: "6:32 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    time: "6:52 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    time: "6:57 pm",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
];
