class CallLog {
  final String date, callStatus, name;
  final String image;
  final bool isVideoCall;

  CallLog({
    this.name = '',
    this.image = '',
    this.date = '',
    this.callStatus = '',
    this.isVideoCall = false,
  });
}

List callsData = [
  CallLog(
    name: "Jenny Wilson",
    image: "assets/images/user.png",
    date: 'Today, 12:19 am',
    callStatus: 'incoming',
    isVideoCall: false,
  ),
  CallLog(
    name: "Esther Howard",
    image: "assets/images/user_2.png",
    date: 'Yesterday, 11:45 pm',
    callStatus: 'incoming',
    isVideoCall: true,
  ),
  CallLog(
    name: "Ralph Edwards",
    image: "assets/images/user_3.png",
    date: 'Yesterday, 11:57 pm',
    callStatus: 'outgoing',
    isVideoCall: false,
  ),
  CallLog(
    name: "Jacob Jones",
    image: "assets/images/user_4.png",
    date: '14 July, 9:19 am',
    callStatus: 'incoming',
    isVideoCall: false,
  ),
  CallLog(
    name: "Albert Flores",
    image: "assets/images/user_5.png",
    date: '13 July, 11:19 pm',
    callStatus: 'incoming',
    isVideoCall: true,
  ),
  CallLog(
    name: "Jenny Wilson",
    image: "assets/images/user.png",
    date: '13 July, 11:50 pm',
    callStatus: 'outgoing',
    isVideoCall: false,
  ),
  CallLog(
    name: "Esther Howard",
    image: "assets/images/user_2.png",
    date: '11 July, 10:19 am',
    callStatus: 'incoming',
    isVideoCall: true,
  ),
  CallLog(
    name: "Ralph Edwards",
    image: "assets/images/user_3.png",
    date: '10 July, 1:19 pm',
    callStatus: 'outgoing',
    isVideoCall: false,
  ),
];
